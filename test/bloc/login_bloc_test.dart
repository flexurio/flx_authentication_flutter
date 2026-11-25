import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_authentication_flutter/src/app/bloc/login/login_bloc.dart';
import 'package:flx_authentication_flutter/src/app/resource/authentication_repository.dart';

class _StubHttpClientAdapter implements HttpClientAdapter {
  _StubHttpClientAdapter(this.handler);

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

String _buildTestJwt(Map<String, dynamic> payload) {
  final header = base64Url.encode(utf8.encode('{"alg":"HS256","typ":"JWT"}'));
  final body = base64Url.encode(utf8.encode(jsonEncode(payload)));
  return '$header.$body.signature';
}

void main() {
  group('LoginBloc', () {
    test(
      'uses POST and emits success for plain JWT string when withTwoFactor is false',
      () async {
        final token = _buildTestJwt({'nip': 'QA-01', 'name': 'QA Manager'});
        final requests = <RequestOptions>[];

        final dio = Dio()
          ..httpClientAdapter = _StubHttpClientAdapter((options) {
            requests.add(options);
            if (options.path.endsWith('/login')) {
              return ResponseBody.fromString(
                jsonEncode({
                  'success': true,
                  'message': 'OK',
                  'data': token,
                }),
                200,
                headers: {
                  Headers.contentTypeHeader: [Headers.jsonContentType],
                },
              );
            }
            return ResponseBody.fromString(
              jsonEncode({'success': true, 'data': <dynamic>[]}),
              200,
              headers: {
                Headers.contentTypeHeader: [Headers.jsonContentType],
              },
            );
          });

        final repo = AuthenticationRepositoryApi(dio: dio, onUnauthorized: () {});
        final bloc = LoginBloc(repository: repo);

        final states = <LoginState>[];
        final sub = bloc.stream.listen(states.add);

        bloc.add(
          const LoginEvent.submit(
            'QA-01',
            'secret',
            false,
            'http://localhost:8107/login',
          ),
        );

        await Future<void>.delayed(const Duration(milliseconds: 100));
        await sub.cancel();
        await bloc.close();

        expect(requests.first.method, equals('POST'));
        expect(
          requests.first.uri.toString(),
          equals('http://localhost:8107/login'),
        );
        expect(
          states.last,
          equals(LoginState.success(token, const [], const {})),
        );
      },
    );

    test(
      'uses GET and emits successWithTwoFactor when withTwoFactor is true',
      () async {
        RequestOptions? loginRequest;
        final dio = Dio()
          ..httpClientAdapter = _StubHttpClientAdapter((options) {
            loginRequest = options;
            return ResponseBody.fromString(
              jsonEncode({
                'success': true,
                'message': 'OK',
                'data': {'auth_at': '1790833344.2201001'},
              }),
              200,
              headers: {
                Headers.contentTypeHeader: [Headers.jsonContentType],
              },
            );
          });

        final repo = AuthenticationRepositoryApi(dio: dio, onUnauthorized: () {});
        final bloc = LoginBloc(repository: repo);

        final states = <LoginState>[];
        final sub = bloc.stream.listen(states.add);

        bloc.add(
          const LoginEvent.submit(
            '2201001',
            'secret',
            true,
            'https://auth.example.com/users/login',
          ),
        );

        await Future<void>.delayed(const Duration(milliseconds: 100));
        await sub.cancel();
        await bloc.close();

        expect(loginRequest?.method, equals('GET'));
        expect(
          states.last,
          equals(const LoginState.successWithTwoFactor('1790833344.2201001')),
        );
      },
    );
  });
}
