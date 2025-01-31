import 'package:flutter/material.dart';
import 'package:flutter_firebase_test/auth/repository/auth_repo.dart';
import 'package:flutter_firebase_test/home_page/home_page.dart';
import 'package:flutter_firebase_test/utils/app_snackbars.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class LoginController extends GetxService {
  var authServices = Get.put(AuthRepo());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isLoading = false.obs;
  var emailError = "".obs;
  var passwordError = "".obs;
  final formKey = GlobalKey<FormState>();

  login() async {
    isLoading.value = true;
    var user = {
      "email": emailController.text,
      "password": passwordController.text,
    };
    try {
      var res = await authServices.login(user);
      isLoading.value = false;

      if (res.statusCode == 200 || res.statusCode == 201) {
        print(res.data);

        AppSnackBars.successSnackBar(
            message: res.data["message"], icon: const Icon(Icons.check));
        Get.to(() => const HomePage());
      } else {
        print(res.data["message"]);
        AppSnackBars.errorSnackBar(
            message: res.data["message"], icon: const Icon(Icons.error));
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }
}
