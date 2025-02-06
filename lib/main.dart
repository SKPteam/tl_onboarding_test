import 'package:flutter/material.dart';
import 'package:flutter_firebase_test/screens/sign_in.dart';
import 'package:flutter_firebase_test/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Test',
      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: primaryColor),
        useMaterial3: true,
      ),
      home: SignIn(),
    );
  }
}
