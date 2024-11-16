import 'package:flutter_firebase_test/data/login_user.dart';
import 'package:flutter_firebase_test/data/repositories/storage.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_it/get_it.dart';

class HomePageController extends GetxController {
  final UserRepository userRepository = GetIt.instance.get<UserRepository>();

  Rxn<LoginUser?> user = Rxn<LoginUser?>();
  void updateUser(LoginUser newUser) {
    user.value = newUser;
  }

  @override
  void onInit() {
    super.onInit();
    fetchUser(); // Fetch user data when the controller initializes
  }

  Future<void> fetchUser() async {
    final userData = await userRepository.getUserData();
    user.value = LoginUser(displayName: userData?.displayName);
  }
}
