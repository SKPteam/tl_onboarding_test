import 'package:flutter/material.dart';
import 'package:flutter_firebase_test/core/constants/app_assets.dart';
import 'package:flutter_firebase_test/core/constants/app_colors.dart';
import 'package:flutter_firebase_test/presentation/home/home_page/home_page_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends GetView<HomePageController> {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppAssets.goodMorning))),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good morning,",
                      style: GoogleFonts.josefinSans(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    Obx(() {
                      return Text(
                        controller.user.value?.displayName ?? "",
                        style: GoogleFonts.josefinSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black),
                      );
                    }),
                  ],
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
