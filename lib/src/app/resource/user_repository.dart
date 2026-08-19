import 'package:flx_authentication_flutter/src/app/model/user.dart';
import 'package:flx_authentication_flutter/src/app/model/user_app.dart';
import 'package:flx_authentication_flutter/src/app/model/user_department.dart';
import 'package:flx_authentication_flutter/src/app/util/jwt.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:hive/hive.dart';

abstract class UserRepository {
  User? user;
  String? token;
  List<String> permissions = [];

  bool checkPermission(String permission) => permissions.contains(permission);

  void setUserFromJwt(String accessToken, List<String> permission);

  void unset() {
    token = null;
    user = null;
  }
}

class UserRepositoryApp extends UserRepository {
  static UserRepositoryApp instance = UserRepositoryApp();

  UserApp? userApp;
  dynamic get department {
    if (departments is List && (departments as List).isEmpty) {
      return null;
    }
    if (departments is List) {
      return (departments as List).first;
    }
    return null;
  }

  dynamic departments = <dynamic>[];

  String? departmentTicket;

  @override
  bool checkPermission(String permission) => permissions.contains(permission);

  @override
  void setUserFromJwt(String accessToken, List<String> permission) {
    token = accessToken;
    final userPayload = extractPayloadFromJwt(accessToken);
    userApp = UserApp.fromJson(userPayload);
    permissions = permission;

    () async {
      final userRepository = await Hive.openBox<dynamic>('user_repository');
      await userRepository.put(
        'permission',
        Permission.toListString(permissions),
      );
    }();
  }

  @override
  void unset() {
    token = null;
    user = null;
  }

  static Map<String, dynamic> dataAdapterFromInstance(dynamic data) {
    if (data is List) {
      return {
        'departments': data.map((e) {
          return {'id': e.id, 'name': e.name};
        }).toList(),
      };
    }
    return {'departments': []};
  }

  void dataAdapterSetup(
    Map<String, dynamic> data, {
    dynamic Function(Map<String, dynamic> json)? departmentParser,
  }) {
    try {
      final departments = data['departments'] as List<dynamic>?;
      if (departments != null) {
        if (departmentParser != null) {
          this.departments = departments
              .cast<Map<String, dynamic>>()
              .map(departmentParser)
              .toList();
        } else {
          this.departments = departments
              .cast<Map<String, dynamic>>()
              .map((e) => UserDepartment.fromJson(e))
              .toList();
        }
      }
    } catch (e) {
      this.departments = [];
    }
  }
}
