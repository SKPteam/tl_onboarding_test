import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_test/core/constants/app_colors.dart';
import 'package:flutter_firebase_test/core/dependency_injection/locator.dart';
import 'package:flutter_firebase_test/presentation/auth/login.dart';
import 'package:flutter_firebase_test/presentation/auth/login_binding.dart';
import 'package:flutter_firebase_test/presentation/home_page/home_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  //Get.put(LoginController());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      //systemNavigationBarColor: AppColors.black,
      statusBarColor: AppColors.white));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: LoginBinding(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(name: "/home", page: () => Homepage(), binding: LoginBinding()),
      ],
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
