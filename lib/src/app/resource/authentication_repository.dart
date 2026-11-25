import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';

class AuthenticationRepositoryApi extends Repository {
  AuthenticationRepositoryApi({
    required super.dio,
    required super.onUnauthorized,
  });

  static String get pathLogin => '${Api.urlAuth}/users/login';
  static String get pathVerifyCode => '${Api.urlAuth}/users/token_auth';
  static String get rolesPath => '${Api.urlApi}/roles';
  static String get rolePath => '${Api.urlApi}/role';
  static String get reportListUserPath => '${Api.urlApi}/report-list-user-access';

  /// Custom path builder untuk fetch roles employee.
  /// Contoh: `(employeeId, host) => '${host ?? Api.urlAuth}/user-roles/$employeeId'`
  static String Function(String employeeId, String? host)? employeeRolesPathBuilder;

  static AuthenticationRepositoryApi instance = AuthenticationRepositoryApi(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<LoginAuthResult> loginWithTwoFactor({
    required String nip,
    required String password,
    required String? url,
    String? method,
  }) async {
    try {
      final targetUrl = url ?? pathLogin;
      final isVerifyPassword = targetUrl.contains('verify-password');
      final resolvedMethod =
          (method ?? (isVerifyPassword ? 'POST' : 'GET')).toUpperCase();
      final response = await dio.request<Map<String, dynamic>>(
        targetUrl,
        data: isVerifyPassword ? jsonEncode({'device_id': ''}) : null,
        options: Options(
          method: resolvedMethod,
          headers: {
            RequestHeader.authorization: getBasicAuthHeader(nip, password),
          },
        ),
      );

      final success = response.data?['success'] as bool? ?? false;
      if (!success) {
        throw ApiException.fromType(ExceptionType.invalidUsernamePassword);
      }

      return _parseLoginAuthResult(
        rawData: response.data?['data'],
        fallbackAuthId: nip,
      );
    } catch (error, stackTrace) {
      print('[ERROR] loginWithTwoFactor failed: $error\n$stackTrace');
      throw checkErrorApi(error);
    }
  }

  LoginAuthResult _parseLoginAuthResult({
    required Object? rawData,
    required String fallbackAuthId,
  }) {
    if (rawData is String && rawData.isNotEmpty) {
      return LoginAuthResult.direct(accessToken: rawData);
    }

    final data = rawData is Map<String, dynamic> ? rawData : null;
    if (data?.containsKey('access_token') ?? false) {
      return LoginAuthResult.direct(
        accessToken: data!['access_token'] as String,
        refreshToken: data['refresh_token'] as String?,
        user: data,
      );
    }

    if (data?.containsKey('auth_at') ?? false) {
      return LoginAuthResult.twoFactor(authId: data!['auth_at'] as String);
    }

    return LoginAuthResult.twoFactor(authId: fallbackAuthId);
  }

  Future<List<String>> fetchUserPermissions({
    required String accessToken,
    required String employeeId,
    String? host,
  }) async {
    try {
      final roles = await employeeRoleFetch(
        accessToken: accessToken,
        employeeId: employeeId,
        host: host,
      );

      final permissions = <String>[];
      for (final role in roles) {
        final rolePermissions = await rolePermissionFetch(
          accessToken: accessToken,
          role: role,
          host: host,
        );
        for (final rolePermission in rolePermissions) {
          if (!permissions.contains(rolePermission)) {
            permissions.add(rolePermission);
          }
        }
      }
      return permissions;
    } catch (e) {
      print('[AUTH REPO] fetchUserPermissions error: $e');
      return <String>[];
    }
  }

  Future<String> login({
    required String nip,
    required String password,
    required String url,
  }) async {
    try {
      print('[LOGIN] login with url: $url');
      final response = await dio.post<Map<String, dynamic>>(
        url,
        options: Options(
          headers: {
            RequestHeader.authorization: getBasicAuthHeader(nip, password),
          },
        ),
      );

      final success = response.data?['success'] as bool? ?? true;
      if (!success) {
        throw ApiException.fromType(ExceptionType.invalidUsernamePassword);
      }

      final rawData = response.data?['data'];
      if (rawData is String && rawData.isNotEmpty) {
        return rawData;
      }
      if (rawData is Map<String, dynamic> &&
          rawData['access_token'] is String) {
        return rawData['access_token'] as String;
      }
      throw ApiException.fromType(ExceptionType.invalidCredentials);
    } catch (error) {
      print('[LOGIN] error: $error');
      throw checkErrorApi(error);
    }
  }

  Future<String> verifyCode({
    required String authId,
    required String code,
    required String? urlAuthApiTwoFactor,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        urlAuthApiTwoFactor ?? pathVerifyCode,
        options: Options(
          headers: {
            RequestHeader.authorization: getBasicAuthHeader(authId, code),
          },
        ),
      );

      final data = response.data!['data'] as Map<String, dynamic>?;
      if (data == null) {
        throw ApiException.fromType(ExceptionType.invalidCredentials);
      }

      return data['access_token'] as String;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Role Permission
  Future<List<String>> rolePermissionFetch({
    required String accessToken,
    required Role role,
    String? host,
  }) async {
    try {
      final path = '${host ?? Api.urlApi}/roles/${role.id}/permissions';
      print('[AUTH REPO] rolePermissionFetch: $path');
      Response<Map<String, dynamic>> response;
      try {
        response = await dio.get<Map<String, dynamic>>(
          path,
          options: Options(
            headers: {RequestHeader.authorization: 'Bearer $accessToken'},
          ),
        );
      } on DioException catch (e) {
        if (e.response?.statusCode == 404) {
          final fallbackPath = '${host ?? Api.urlAuth}/roles/${role.id}/permissions';
          print('[AUTH REPO] rolePermissionFetch fallback: $fallbackPath');
          response = await dio.get<Map<String, dynamic>>(
            fallbackPath,
            options: Options(
              headers: {RequestHeader.authorization: 'Bearer $accessToken'},
            ),
          );
        } else {
          rethrow;
        }
      }

      final roles = <String>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        roles.add((data as Map<String, dynamic>)['permission_id'] as String);
      }

      return roles;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> rolePermissionCreate({
    required String accessToken,
    required Role role,
    required String permission,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        '$rolesPath/${role.id}/permissions/$permission',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> rolePermissionDelete({
    required String accessToken,
    required Role role,
    required String permission,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$rolesPath/${role.id}/permissions/$permission',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Role
  Future<PageOptions<Role>> roleFetch({
    required String accessToken,
    required PageOptions<Role> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        rolePath,
        queryParameters: pageOptions.toUrlQueryMap(),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(response, Role.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> roleCreate({
    required String accessToken,
    required String description,
    required String name,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        rolesPath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({'name': name, 'description': description}),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> roleUpdate({
    required String accessToken,
    required Role role,
    required String name,
    required String description,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$rolesPath/${role.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({'name': name, 'description': description}),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> roleDelete({
    required String accessToken,
    required Role role,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$rolesPath/${role.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Role Employee
  Future<List<Role>> employeeRoleFetch({
    required String accessToken,
    required String employeeId,
    required String? host,
  }) async {
    if (employeeId.isEmpty || employeeId == 'null') {
      print('[AUTH REPO] employeeRoleFetch: employeeId is empty or null');
      return <Role>[];
    }
    try {
      final path = employeeRolesPathBuilder != null
          ? employeeRolesPathBuilder!(employeeId, host)
          : '${host ?? Api.urlApi}/users/$employeeId/roles';
      print('[AUTH REPO] employeeRoleFetch: $path');
      Response<Map<String, dynamic>> response;
      try {
        response = await dio.get<Map<String, dynamic>>(
          path,
          options: Options(
            headers: {RequestHeader.authorization: 'Bearer $accessToken'},
          ),
        );
      } on DioException catch (e) {
        if (e.response?.statusCode == 404 && employeeRolesPathBuilder == null) {
          final fallbackPath = '${host ?? Api.urlAuth}/user-roles/$employeeId';
          print('[AUTH REPO] employeeRoleFetch fallback: $fallbackPath');
          response = await dio.get<Map<String, dynamic>>(
            fallbackPath,
            options: Options(
              headers: {RequestHeader.authorization: 'Bearer $accessToken'},
            ),
          );
        } else {
          rethrow;
        }
      }

      final roles = <Role>[];

      for (final data in response.data!['data'] as List) {
        final roleMap = data as Map<String, dynamic>;
        final roleData = roleMap['role'] ?? roleMap['role_id'] ?? roleMap;
        if (roleData is Map<String, dynamic>) {
          final role = Role.fromJson(roleData);
          roles.add(role);
        }
      }

      print('[AUTH REPO] employeeRoleFetch: $roles');
      return roles;
    } catch (error, st) {
      print('[AUTH REPO] employeeRoleFetch error!\n$st');
      throw checkErrorApi(error);
    }
  }

  Future<List<String>> roleEmployeeFetch({
    required String accessToken,
    required Role role,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$rolesPath/${role.id}/users',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      final employee = <String>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        final userId = (data as Map<String, dynamic>)['user_id'];
        if (userId != null) {
          employee.add(userId.toString());
        }
      }

      return employee;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> roleEmployeeCreate({
    required String accessToken,
    required String userId,
    required Role role,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        '${Api.urlApi}/users/$userId/roles/${role.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> roleEmployeeDelete({
    required String accessToken,
    required String userId,
    required Role role,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '${Api.urlApi}/users/$userId/roles/${role.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<ReportAccess>> reportAccessFetch({
    required String accessToken,
    String? departmentName,
    String? employeeId,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        reportListUserPath,
        queryParameters: {
          'department_name.eq': departmentName,
          'nip.eq': employeeId,
        },
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      final reportAccess = <ReportAccess>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        reportAccess.add(ReportAccess.fromJson(data as Map<String, dynamic>));
      }

      return reportAccess;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
