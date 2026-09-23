// ignore_for_file: avoid_dynamic_calls
import 'package:flutter/material.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:go_router/go_router.dart';

Future<void> runChiron(
  String appName,
  FlavorConfig<dynamic> config,
  List<Menu1> menu, {
  List<RouteBase> additionalRoutes = const [],
  List<Widget> Function(BuildContext context, String query)? searchData,
  void Function()? onInitialized,
  Future<Map<String, dynamic>> Function(
    String accessToken,
    Map<String, dynamic> userPayload,
  )? onLoginSuccess,
  void Function(Map<String, dynamic> data)? onLogin,
}) async {
  await runChironApp(
    appName: appName,
    config: config,
    menu: menu,
    additionalRoutes: additionalRoutes,
    searchData: searchData,
    onInitialized: onInitialized,
    onLoginSuccess: onLoginSuccess,
    onLogin: onLogin,
  );
}

Future<void> runChironApp({
  required String appName,
  required FlavorConfig<dynamic> config,
  required List<Menu1> menu,
  List<RouteBase> additionalRoutes = const [],
  List<Widget> Function(BuildContext context, String query)? searchData,
  void Function()? onInitialized,
  Future<Map<String, dynamic>> Function(
    String accessToken,
    Map<String, dynamic> userPayload,
  )? onLoginSuccess,
  void Function(Map<String, dynamic> data)? onLogin,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  globalApplicationMenus = menu;

  final home = AuthenticationBuilder(
    authenticated: () {
      final user = UserRepositoryApp.instance.userApp;
      final name = user?.name ?? '-';

      return MenuPage.prepare(
        appName: appName,
        menu: menu,
        accountPermissions: UserRepositoryApp.instance.permissions,
        accountName: name,
        accountSubtitle: _getAccountSubtitle(),
        onLogout: () =>
            AuthenticationBloc.instance.add(const AuthenticationEvent.logout()),
        onChangePassword: (context) {},
        searchData: searchData ?? (context, query) => [],
      );
    },
    unAuthenticated: _getLoginPage(config, onLoginSuccess),
  );

  final router = GoRouter(
    initialLocation: '/',
    routes: [
      ...additionalRoutes,
      GoRoute(path: '/', builder: (context, state) => home),
      GoRoute(
        path: '/login',
        builder: (context, state) => _getLoginPage(config, onLoginSuccess),
      ),
    ],
  );

  final app = App(routerConfig: router);

  await run(
    config: config,
    app: app,
    initialized: () {
      if (onInitialized != null) {
        onInitialized();
      }
      AuthenticationRepository.initialize(
        userRepository: UserRepositoryApp.instance,
        onLogin: (data) {
          if (onLogin != null) {
            onLogin(data);
          }
          NoCode.setAuth(UserRepositoryApp.instance.token!);
        },
      );
    },
  );
}

String _getAccountSubtitle() {
  final user = UserRepositoryApp.instance.userApp;
  final nip = user?.nip ?? '-';

  var departmentName = UserRepositoryApp.instance.department?.name ?? '';
  final departments = UserRepositoryApp.instance.departments;

  if (departments is List && departments.length > 1) {
    departmentName += ' (+${departments.length - 1})';
  }

  return '$nip — $departmentName';
}

Widget _getLoginPage(
  FlavorConfig<dynamic> config,
  Future<Map<String, dynamic>> Function(
    String accessToken,
    Map<String, dynamic> userPayload,
  )? onLoginSuccess,
) {
  return LoginPage.prepare(
    withTwoFactor: true,
    onLoginSuccess: onLoginSuccess ??
        (accessToken, userPayload) async => <String, dynamic>{},
    logoUrl: 'asset/image/logo-company-${config.companyId}.png',
    logoNamedUrl: 'asset/image/logo-name-company-${config.companyId}.png',
    // configAssetPath:
    //     'asset/configuration-login/login_config_${config.companyId}.json', // login dengan text
    configAssetPath:
        'asset/configuration-login/login_config_image_${config.companyId}.json', // login dengan gambar
  );
}
