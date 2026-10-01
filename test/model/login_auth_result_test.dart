import 'package:flutter_test/flutter_test.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';

void main() {
  group('LoginAuthResult', () {
    test('LoginAuthResult.twoFactor creates correct state', () {
      const result = LoginAuthResult.twoFactor(authId: '1790828032.2201001');

      expect(result.isTwoFactor, isTrue);
      expect(result.authId, equals('1790828032.2201001'));
      expect(result.accessToken, isNull);
      expect(result.refreshToken, isNull);
      expect(result.user, isNull);
    });

    test('LoginAuthResult.direct creates correct state', () {
      final userMap = {
        'id': 1901016,
        'name': 'MILA AMELIA',
        'role': 'Administrator',
      };
      final result = LoginAuthResult.direct(
        accessToken: 'mock_access_token',
        refreshToken: 'mock_refresh_token',
        user: userMap,
      );

      expect(result.isTwoFactor, isFalse);
      expect(result.authId, isNull);
      expect(result.accessToken, equals('mock_access_token'));
      expect(result.refreshToken, equals('mock_refresh_token'));
      expect(result.user, equals(userMap));
    });
  });
}
