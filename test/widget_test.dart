import 'package:flutter_test/flutter_test.dart';
import 'package:flx_authentication_flutter/main.dart';
import 'package:pinput/pinput.dart';

void main() {
  testWidgets('MyApp renders Pinput widget test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(Pinput), findsOneWidget);
  });
}
