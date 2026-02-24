import 'package:flutter/material.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_authentication_flutter/widgetbook.directories.g.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class UserRepositoryMock extends UserRepository {
  @override
  void setUserFromJwt(String accessToken, List<String> permission) {
    token = accessToken;
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
              data: ThemeData.light(),
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: ThemeData.dark(),
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
