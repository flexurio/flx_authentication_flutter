import 'package:flutter_test/flutter_test.dart';
import 'package:flx_authentication_flutter/src/app/model/user.dart';
import 'package:flx_authentication_flutter/src/app/resource/user_repository.dart';

class FakeUser extends User {
  FakeUser({required super.id, required super.name});

  @override
  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}

class MockUserRepository extends UserRepository {
  @override
  void setUserFromJwt(
    String accessToken,
    List<String> permission, {
    String? refreshToken,
  }) {
    token = accessToken;
    this.refreshToken = refreshToken;
    permissions = permission;
    user = FakeUser(id: 1, name: 'Test User');
  }
}

void main() {
  group('UserRepository', () {
    late MockUserRepository repository;

    setUp(() {
      repository = MockUserRepository();
    });

    test('setUserFromJwt sets token, refreshToken, and permissions correctly', () {
      repository.setUserFromJwt(
        'mock_access_token',
        ['read:user', 'write:user'],
        refreshToken: 'mock_refresh_token',
      );

      expect(repository.token, equals('mock_access_token'));
      expect(repository.refreshToken, equals('mock_refresh_token'));
      expect(repository.permissions, equals(['read:user', 'write:user']));
      expect(repository.checkPermission('read:user'), isTrue);
      expect(repository.checkPermission('delete:user'), isFalse);
      expect(repository.user, isNotNull);
      expect(repository.user?.id, equals(1));
      expect(repository.user?.name, equals('Test User'));
    });

    test('unset clears token, refreshToken, and user', () {
      repository.setUserFromJwt(
        'mock_access_token',
        ['read:user'],
        refreshToken: 'mock_refresh_token',
      );

      repository.unset();

      expect(repository.token, isNull);
      expect(repository.refreshToken, isNull);
      expect(repository.user, isNull);
    });
  });
}
