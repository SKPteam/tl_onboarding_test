import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_test/core/constants/app_colors.dart';
import 'package:flutter_firebase_test/core/dependency_injection/locator.dart';
import 'package:flutter_firebase_test/presentation/auth/login.dart';
import 'package:flutter_firebase_test/presentation/auth/login_controller.dart';
import 'package:flutter_firebase_test/presentation/home/bottom_nav/bottom_nav.dart';
import 'package:flutter_firebase_test/presentation/home/bottom_nav/bottom_nav_controller.dart';
import 'package:flutter_firebase_test/presentation/home/chats/chat_controller.dart';
import 'package:flutter_firebase_test/presentation/home/chats/chats.dart';
import 'package:flutter_firebase_test/presentation/home/chats/widgets/suggestion_chips_controler.dart';
import 'package:flutter_firebase_test/presentation/home/home_page/home_page.dart';
import 'package:flutter_firebase_test/presentation/home/home_page/home_page_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(LoginController());
  Get.put(BottomNavController());
  Get.put(HomePageController());
  Get.put(ChatController());
  Get.put(SuggestionChipsController());
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
      //initialBinding: LoginBinding(),
      title: 'Flutter Demo',
      theme: ThemeData(
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: AppColors.green),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.white),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
          name: "/home",
          page: () => const Homepage(),
          //binding: LoginBinding(),
        ),
        GetPage(
          name: "/bottomNav",
          page: () => BottomNav(),
          //  binding: BottomNavBinding()
        ),
        GetPage(
          name: "/chatbot",
          page: () => Chats(),
          //  binding: BottomNavBinding()
        )
      ],
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
