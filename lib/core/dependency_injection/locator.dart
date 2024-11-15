import 'package:flutter_firebase_test/api/services/login_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
Future<void> setupLocator() async {
  //Service
  locator.registerLazySingleton(() => LoginUserService());

  //Services
}
