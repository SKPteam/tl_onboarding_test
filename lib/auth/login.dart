import 'package:flutter/material.dart';
import 'package:flutter_firebase_test/auth/repository/auth_controller.dart';
import 'package:flutter_firebase_test/home_page/home_page.dart';
import 'package:flutter_firebase_test/utils/button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final controller = Get.put(LoginController());

  bool _isHidden = true;
  bool isChecked = false;
  //final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xffFFFFFF),
        centerTitle: false,
        title: const Padding(
          padding: EdgeInsets.only(
            left: 9,
          ),
          child: Text(
            'Sign in to your account',
            style: TextStyle(
              color: Color(0xff333333),
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
          ),
          child: Form(
            key: controller.formKey,
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(
                        0xff555555,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.only(top: 11.5.w, bottom: 11.5.w),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.emailController,
                        decoration: InputDecoration(
                            hintStyle: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffAAAAAA)),
                            contentPadding: EdgeInsets.only(
                              top: 10.w,
                              bottom: 10.w,
                              left: 8.w,
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xffD4D4D4),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: "example@mail.com",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xffD4D4D4),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xffD4D4D4),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            )
                            //enabledBorder: InputBorder.none),
                            ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is Required';
                          } else if (!value.contains(
                            RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"),
                          )) {
                            return 'Enter a correct email address';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  const Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(
                        0xff555555,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 11.5.w, bottom: 11.5.w),
                    child: TextFormField(
                      obscureText: _isHidden,
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isHidden = !_isHidden;
                              });
                            },
                            icon: Icon(
                              _isHidden
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              size: 20,
                              color: const Color(0xff656565),
                            ),
                          ),
                          hintStyle: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffAAAAAA)),
                          contentPadding: EdgeInsets.only(
                            top: 10.w,
                            bottom: 10.w,
                            left: 8.w,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: Color(0xffD4D4D4),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: "**********",
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: Color(0xffD4D4D4),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: Color(0xffD4D4D4),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          )
                          //enabledBorder: InputBorder.none),
                          ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password can't be empty ";
                        } else if (value.length < 6) {
                          return 'Length of password should be greater than 6';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 200.5.h,
                  ),
                  AppButton(
                    title: controller.isLoading.value == true
                        ? "Logging in..."
                        : "Next",
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.login();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
