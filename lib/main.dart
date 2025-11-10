import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flx Authentication',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Scaffold(
        body: Pinput(
          enableInteractiveSelection: true,
          autofocus: true,
          length: 6,
          defaultPinTheme: PinTheme(height: 50, width: 50),
        ),
      ),
    );
  }
}
