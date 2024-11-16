import 'package:flutter_firebase_test/api/services/login_service.dart';
import 'package:flutter_firebase_test/data/login_user.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_it/get_it.dart';

class LoginController extends GetxController {
  final LoginUserService loginUserService =
      GetIt.instance.get<LoginUserService>();

  final RxBool isLoading = false.obs;
  final RxBool isObscured = true.obs;
  final user = Rxn<LoginUser>();

  void togglePasswordVisibility() {
    isObscured.value = !isObscured.value;
  }

  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      final result = await loginUserService.login(email, password);

      if (result != null) {
        user.value = result;
        Get.snackbar("Success", "Login succesful");
        Get.offNamed('/bottomNav');
      } else {
        Get.snackbar('Error', 'Login failed. Please try again.');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
