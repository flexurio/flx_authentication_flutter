import 'package:flutter_test/flutter_test.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class FakeStorage implements Storage {
  final Map<String, dynamic> _memory = {};

  @override
  dynamic read(String key) => _memory[key];

  @override
  Future<void> write(String key, dynamic value) async {
    _memory[key] = value;
  }

  @override
  Future<void> delete(String key) async {
    _memory.remove(key);
  }

  @override
  Future<void> clear() async {
    _memory.clear();
  }

  @override
  Future<void> close() async {}
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
  }
}

void main() {
  late Storage storage;
  late MockUserRepository userRepository;
  Map<String, dynamic>? lastLoginData;

  setUp(() {
    storage = FakeStorage();
    HydratedBloc.storage = storage;

    userRepository = MockUserRepository();
    lastLoginData = null;

    AuthenticationBloc.initialize(
      userRepository: userRepository,
      onLogin: (data) {
        lastLoginData = data;
      },
    );
  });

  group('AuthenticationBloc', () {
    test('initial state is unauthenticated', () {
      expect(
        AuthenticationBloc.instance.state,
        equals(const AuthenticationState.unauthenticated()),
      );
    });

    test('login event sets user in repository and emits authenticated state with refreshToken', () async {
      final bloc = AuthenticationBloc.instance;
      final permissions = ['admin', 'user'];
      final data = {'company_id': '101'};

      bloc.add(
        AuthenticationEvent.login(
          'test_access_token',
          permissions,
          data,
          refreshToken: 'test_refresh_token',
        ),
      );

      await expectLater(
        bloc.stream,
        emits(
          AuthenticationState.authenticated(
            'test_access_token',
            permissions,
            data,
            refreshToken: 'test_refresh_token',
          ),
        ),
      );

      expect(userRepository.token, equals('test_access_token'));
      expect(userRepository.refreshToken, equals('test_refresh_token'));
      expect(userRepository.permissions, equals(permissions));
      expect(lastLoginData, equals(data));
    });

    test('logout event unsets user repository and emits unauthenticated', () async {
      final bloc = AuthenticationBloc.instance;

      bloc.add(const AuthenticationEvent.logout());

      await expectLater(
        bloc.stream,
        emits(const AuthenticationState.unauthenticated()),
      );

      expect(userRepository.token, isNull);
      expect(userRepository.refreshToken, isNull);
    });

    test('toJson and fromJson handles refreshToken properly', () {
      final bloc = AuthenticationBloc.instance;
      const state = AuthenticationState.authenticated(
        'mock_jwt',
        ['read'],
        {'key': 'val'},
        refreshToken: 'mock_refresh',
      );

      final json = bloc.toJson(state);
      expect(json, isNotNull);
      expect(json!['accessToken'], equals('mock_jwt'));
      expect(json['refreshToken'], equals('mock_refresh'));
      expect(json['data'], equals({'key': 'val'}));

      final restoredState = bloc.fromJson(json);
      expect(restoredState, isNotNull);
      restoredState!.maybeWhen(
        authenticated: (token, perms, data, refresh) {
          expect(token, equals('mock_jwt'));
          expect(refresh, equals('mock_refresh'));
        },
        orElse: () => fail('State should be authenticated'),
      );
    });
  });
}
