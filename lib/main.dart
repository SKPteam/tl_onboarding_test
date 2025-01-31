import 'package:flutter/material.dart';
import 'package:flutter_firebase_test/auth/login.dart';
import 'package:flutter_firebase_test/home_page/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(

        ///setup to fit into bigger screens
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return GetMaterialApp(
              builder: (context, child) {
                final mediaQueryData = MediaQuery.of(context);
                final scale = mediaQueryData.textScaler
                    .clamp(minScaleFactor: 0.2, maxScaleFactor: 1.1);
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaler: scale),
                  child: child!,
                );
              },
              title: 'Flutter Test',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  fontFamily: 'JosefinSans',
                  primarySwatch: Colors.blue,
                  primaryColor: Colors.blue,
                  appBarTheme: const AppBarTheme(
                    color: Colors.white,
                  )),
              home: const LoginView());
        });
  }
}
