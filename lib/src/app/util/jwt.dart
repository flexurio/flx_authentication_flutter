import 'package:flx_core_flutter/flx_core_flutter.dart';

Map<String, dynamic> extractPayloadFromJwt(String jwt) {
  final parts = jwt.split('.');
  if (parts.length != 3) {
    throw ArgumentError();
  }

  final payload = parts[1];
  return base64ToMap(payload);
}
