import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text(
            "Sign in to your account",
            style: TextStyle(fontSize: 22),
          )
        ],
      ),
    );
  }
}
