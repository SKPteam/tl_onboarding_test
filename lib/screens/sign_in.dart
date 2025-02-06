import 'package:flutter/material.dart';
import 'package:flutter_firebase_test/models/user.dart';
import 'package:flutter_firebase_test/screens/home_page.dart';
import 'package:flutter_firebase_test/services/api.dart';
import 'package:flutter_firebase_test/styles.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = '';

  String password = '';

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Text(
          "Sign in to your account",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            labeledTextField(label: 'Email', onChanged: (val) => email = val),
            const SizedBox(height: 25),
            labeledTextField(
                label: 'Password',
                isPassword: true,
                onChanged: (val) => password = val),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size.fromHeight(50)),
                onPressed: () async {
                  setState(() => isLoading = true);
                  try {
                    User user = await Api.loginApi(email, password);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomePage(user: user)));
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                  setState(() => isLoading = false);
                },
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        "Next",
                        style: TextStyle(fontSize: 16),
                      ),
              ),
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }

  //--------------------------------------------------------------------------------------------
  Widget labeledTextField({
    String label = '',
    bool isPassword = false,
    Function(String)? onChanged,
  }) {
    bool showPassword = false;
    return StatefulBuilder(builder: (context, setState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 10),
          TextField(
            onChanged: onChanged,
            obscureText: !showPassword && isPassword,
            obscuringCharacter: "*",
            style: const TextStyle(fontSize: 15),
            decoration: InputDecoration(
                hintText: isPassword ? "******" : "example@email.com",
                hintStyle: const TextStyle(color: Colors.grey),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                enabledBorder: textFieldBorder,
                border: textFieldBorder,
                suffixIcon: isPassword
                    ? IconButton(
                        onPressed: () {
                          setState(() => showPassword = !showPassword);
                        },
                        icon: Icon(
                          showPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.grey.shade600,
                        ),
                      )
                    : null),
          )
        ],
      );
    });
  }
}
