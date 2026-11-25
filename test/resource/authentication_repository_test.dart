import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_authentication_flutter/src/app/resource/authentication_repository.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';

class MockHttpClientAdapter implements HttpClientAdapter {
  MockHttpClientAdapter(this.handler);

  final ResponseBody Function(RequestOptions options) handler;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    return handler(options);
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  group('AuthenticationRepositoryApi.loginWithTwoFactor', () {
    late Dio dio;
    late Map<String, dynamic> mockResponseBody;
    int mockStatusCode = 200;

    setUp(() {
      dio = Dio();
      dio.httpClientAdapter = MockHttpClientAdapter((options) {
        return ResponseBody.fromString(
          jsonEncode(mockResponseBody),
          mockStatusCode,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType],
          },
        );
      });
    });

    test('returns LoginAuthResult.twoFactor with nip when data is null (Voltune flow)', () async {
      mockResponseBody = {
        'success': true,
        'message': 'Token sent to telegram',
        'data': null,
      };

      final repo = AuthenticationRepositoryApi(
        dio: dio,
        onUnauthorized: () {},
      );

      final result = await repo.loginWithTwoFactor(
        nip: '085640236376',
        password: '',
        url: 'https://example.com/login',
      );

      expect(result.isTwoFactor, isTrue);
      expect(result.authId, equals('085640236376'));
      expect(result.accessToken, isNull);
    });

    test('returns LoginAuthResult.direct when response contains access_token (DJM flow)', () async {
      mockResponseBody = {
        'success': true,
        'message': 'OK',
        'data': {
          'access_token': 'mock_access_token',
          'refresh_token': 'mock_refresh_token',
          'nip': '1901016',
        },
      };

      final repo = AuthenticationRepositoryApi(
        dio: dio,
        onUnauthorized: () {},
      );

      final result = await repo.loginWithTwoFactor(
        nip: '1901016',
        password: 'password',
        url: 'https://example.com/login',
      );

      expect(result.isTwoFactor, isFalse);
      expect(result.accessToken, equals('mock_access_token'));
      expect(result.refreshToken, equals('mock_refresh_token'));
    });

    test('returns LoginAuthResult.twoFactor with auth_at when response contains auth_at (Metiska flow)', () async {
      mockResponseBody = {
        'success': true,
        'message': 'OK',
        'data': {
          'auth_at': '1790833344.2201001',
          'expire_at': 1790833644,
        },
      };

      final repo = AuthenticationRepositoryApi(
        dio: dio,
        onUnauthorized: () {},
      );

      final result = await repo.loginWithTwoFactor(
        nip: '2201001',
        password: 'password',
        url: 'https://example.com/login',
      );

      expect(result.isTwoFactor, isTrue);
      expect(result.authId, equals('1790833344.2201001'));
    });

    test('throws Exception when success is false', () async {
      mockResponseBody = {
        'success': false,
        'message': 'Invalid Username or Password',
      };

      final repo = AuthenticationRepositoryApi(
        dio: dio,
        onUnauthorized: () {},
      );

      expect(
        () => repo.loginWithTwoFactor(
          nip: '2201001',
          password: 'wrong_password',
          url: 'https://example.com/login',
        ),
        throwsA(isA<Exception>()),
      );
    });

    test(
      'sends POST and returns LoginAuthResult.direct when method is POST and data is plain JWT string (flx-nocode-api flow)',
      () async {
        RequestOptions? capturedOptions;
        dio.httpClientAdapter = MockHttpClientAdapter((options) {
          capturedOptions = options;
          return ResponseBody.fromString(
            jsonEncode({
              'success': true,
              'message': 'Login success',
              'data': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.payload.sig',
            }),
            200,
            headers: {
              Headers.contentTypeHeader: [Headers.jsonContentType],
            },
          );
        });

        final repo = AuthenticationRepositoryApi(
          dio: dio,
          onUnauthorized: () {},
        );

        final result = await repo.loginWithTwoFactor(
          nip: 'qa_manager',
          password: 'secret',
          url: 'http://localhost:8107/login',
          method: 'POST',
        );

        expect(capturedOptions?.method, equals('POST'));
        expect(capturedOptions?.data, isNull);
        expect(result.isTwoFactor, isFalse);
        expect(
          result.accessToken,
          equals('eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.payload.sig'),
        );
      },
    );
  });
}
