import 'package:flutter/material.dart';
import 'package:flutter_firebase_test/core/app_widgets/app_button.dart';
import 'package:flutter_firebase_test/core/app_widgets/app_textfield.dart';
import 'package:flutter_firebase_test/core/constants/app_colors.dart';
import 'package:flutter_firebase_test/core/constants/extensions/extensions.dart';
import 'package:flutter_firebase_test/presentation/auth/login_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Sign in to your account",
                  style: GoogleFonts.josefinSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: AppColors.black),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Email",
                  style: GoogleFonts.josefinSans(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ).padding(padding: const EdgeInsets.only(bottom: 8)),
                AppTextFields(
                  controller: emailController,
                  hintText: "example@email.com",
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Password",
                  style: GoogleFonts.josefinSans(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ).padding(padding: const EdgeInsets.only(bottom: 8)),
                Obx(
                  () => AppTextFields(
                    hintText: "******",
                    obscureText: controller.isObscured.value,
                    controller: passwordController,
                    suffWidget: IconButton(
                        onPressed: () {
                          controller.togglePasswordVisibility();
                        },
                        icon: Icon(
                          controller.isObscured.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColors.grey,
                          size: 20,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 450,
                ),
                Obx(() => PrimaryButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : () {
                              if (emailController.text.isEmpty ||
                                  passwordController.text.isEmpty) {
                                Get.snackbar(
                                  'Error',
                                  'Please enter both email and password',
                                  snackPosition: SnackPosition.TOP,
                                );
                                return;
                              }
                              controller.loginUser(emailController.text,
                                  passwordController.text);
                            },
                      width: size.width,
                      isLoading: controller.isLoading.value,
                      backgroundColor: AppColors.green,
                      text: "Next",
                      textColor: AppColors.textWhite,
                    ).padding(padding: const EdgeInsets.only(bottom: 40)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
