import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_test/app/modules%20/authentication/state/login_state.dart';
import 'package:flutter_firebase_test/app/modules%20/bottomnavbar/models/dto/dashboard_dto.dart';
import 'package:flutter_firebase_test/app/shared/constants/constant.dart';
import 'package:flutter_firebase_test/app/shared/presentation/widgets/components/button_component.dart';
import 'package:flutter_firebase_test/app/shared/presentation/widgets/components/textfield_component.dart';
import 'package:flutter_firebase_test/core/framework/app_texts/apptexts.dart';
import 'package:flutter_firebase_test/core/framework/theme/colors/app_colors.dart';
import 'package:flutter_firebase_test/core/framework/theme/sizes/sizes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../bottomnavbar/presentation/pages/bottom_nav_bar.dart';
import '../../bloc/login_bloc.dart';
import '../../event/login_event.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

DashboardDto dashboardDto = DashboardDto();
Future<void> saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('auth_token', token);
  globalToken = token;
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      AppTexts.signUpDesc,
                      style: TextStyle(
                        fontSize: TextSizes.size24,
                        fontWeight: FontWeight.w500,
                        color: AppColors.largeTextColor,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFieldComponent(
                      textEditingController: _emailController,
                      header: AppTexts.email,
                      hint: AppTexts.emailDesc,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFieldComponent(
                      textEditingController: _passwordController,
                      header: AppTexts.password,
                      hint: AppTexts.passwordDesc,
                    )
                  ],
                ),
              ),
              BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    final userData = state.userData;
                    dashboardDto.displayName =
                        userData['display_name'] ?? 'Unknown';
                    dashboardDto.userId = userData["id"] ?? 'Unknown';
                    dashboardDto.token = userData["auth_token"] ?? 'Unknown';
                    if (dashboardDto.token != 'Unknown') {
                      saveToken(dashboardDto.token!); // Save token securely
                    }
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => BottomNavBar(
                              dashboardDto: DashboardDto(
                                displayName: dashboardDto.displayName,
                                userId: dashboardDto.userId,
                              ),
                            )));
                  } else if (state is LoginFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          backgroundColor: Colors.red,
                          content:
                              Center(child: Text('Error: ${state.error}'))),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: AppColors.green,
                    ));
                  }
                  return CustomButton(
                    text: AppTexts.next,
                    onPressed: () {
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      context.read<LoginBloc>().add(
                            LoginButtonPressed(
                                email: email, password: password),
                          );
                    },
                    expanded: true,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
