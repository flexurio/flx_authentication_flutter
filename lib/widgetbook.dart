import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_authentication_flutter/widgetbook.directories.g.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

String _buildMockJwt(String nip) {
  final header = base64Url.encode(utf8.encode('{"alg":"HS256","typ":"JWT"}'));
  final payload = base64Url.encode(
    utf8.encode(
      jsonEncode({
        'nip': nip,
        'name': 'Mock User ($nip)',
        'rl': 'plant_qa_manager',
      }),
    ),
  );
  return '$header.$payload.mock_signature';
}

void _installMockAuthInterceptor() {
  Api.dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        if (options.uri.host != 'mock.local') {
          return handler.next(options);
        }

        final path = options.uri.path;
        final method = options.method.toUpperCase();

        if (path == '/login') {
          if (method != 'POST') {
            return handler.reject(
              DioException(
                requestOptions: options,
                response: Response<Map<String, dynamic>>(
                  requestOptions: options,
                  statusCode: 405,
                  data: {
                    'success': false,
                    'message': 'Method Not Allowed (allow: POST)',
                  },
                ),
                type: DioExceptionType.badResponse,
              ),
            );
          }

          final authHeader =
              options.headers['Authorization']?.toString() ?? '';
          var nip = 'mock_user';
          var password = '';
          if (authHeader.startsWith('Basic ')) {
            final decoded = utf8.decode(
              base64Decode(authHeader.substring(6)),
            );
            final sep = decoded.indexOf(':');
            if (sep >= 0) {
              nip = decoded.substring(0, sep);
              password = decoded.substring(sep + 1);
            }
          }

          if (password == 'wrong') {
            return handler.resolve(
              Response<Map<String, dynamic>>(
                requestOptions: options,
                statusCode: 200,
                data: {
                  'success': false,
                  'message': 'Invalid Username or Password',
                },
              ),
            );
          }

          return handler.resolve(
            Response<Map<String, dynamic>>(
              requestOptions: options,
              statusCode: 200,
              data: {
                'success': true,
                'message': 'Login success (mock flx-nocode-api)',
                'data': _buildMockJwt(nip),
              },
            ),
          );
        }

        if (path == '/users/login') {
          return handler.resolve(
            Response<Map<String, dynamic>>(
              requestOptions: options,
              statusCode: 200,
              data: {
                'success': true,
                'message': 'OTP sent',
                'data': {'auth_at': '1790833344.mock'},
              },
            ),
          );
        }

        return handler.resolve(
          Response<Map<String, dynamic>>(
            requestOptions: options,
            statusCode: 200,
            data: {'success': true, 'data': <dynamic>[]},
          ),
        );
      },
    ),
  );
}

class UserRepositoryMock extends UserRepository {
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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );

  AuthenticationBloc.initialize(
    userRepository: UserRepositoryMock(),
    onLogin: (data) {},
  );

  flavorConfig = FlavorConfig(
    companyId: '1',
    companyName: 'Flexurio',
    companyPhone: '08123456789',
    companyWebsite: 'https://flexurio.erp',
    companyAddress: 'Flexurio Office',
    apiUrl: 'https://api.flexurio.erp',
    color: Colors.blue,
    colorSoft: Colors.blue.withValues(alpha: 0.1),
    backgroundLoginPage: '',
    applicationConfig: null,
  );

  _installMockAuthInterceptor();

  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: MyTheme.getTheme(flavorConfig.color, ThemeMode.light),
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: MyTheme.getTheme(flavorConfig.color, ThemeMode.dark),
            ),
          ],
        ),
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhone13,
            Devices.windows.laptop,
          ],
        ),
      ],
    );
  }
}
