import 'package:flutter/material.dart';
import 'package:flutter_firebase_test/auth/repository/auth_repo.dart';
import 'package:flutter_firebase_test/home_page/home_page.dart';
import 'package:flutter_firebase_test/utils/app_snackbars.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        var responseData = res.data;

        print(res.data);

        //    // Save data to SharedPreferences
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // await prefs.setString("auth_token", responseData["data"]["auth_token"]);
        // await prefs.setInt("user_id", responseData["data"]["id"]);
        // await prefs.setString("email", responseData["data"]["email"]);
        // await prefs.setString("display_name", responseData["data"]["display_name"]);
        // await prefs.setString("phone", responseData["data"]["phone"]);
        // await prefs.setString("location", responseData["data"]["location"]);
        // await prefs.setDouble("latitude", responseData["data"]["latitude"]);
        // await prefs.setDouble("longitude", responseData["data"]["longitude"]);

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
