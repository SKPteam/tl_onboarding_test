import 'package:flutter_firebase_test/presentation/auth/login.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
