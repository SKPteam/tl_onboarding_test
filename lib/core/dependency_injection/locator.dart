import 'package:flutter_firebase_test/api/api_utils/api_utils.dart';
import 'package:flutter_firebase_test/api/services/create_chat_service.dart';
import 'package:flutter_firebase_test/api/services/login_service.dart';
import 'package:flutter_firebase_test/data/repositories/chat.dart';
import 'package:flutter_firebase_test/data/repositories/storage.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
Future<void> setupLocator() async {
  //Service
  locator.registerLazySingleton(() => LoginUserService());
  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => ApiUtils());
  locator.registerLazySingleton(() => ChatService());
  locator.registerLazySingleton(() => ChatRepository());

  //Services
}
