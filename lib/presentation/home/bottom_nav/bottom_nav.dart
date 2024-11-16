import 'package:flutter/material.dart';
import 'package:flutter_firebase_test/core/constants/app_assets.dart';
import 'package:flutter_firebase_test/core/constants/app_colors.dart';
import 'package:flutter_firebase_test/presentation/home/bottom_nav/bottom_nav_controller.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNav extends GetView<BottomNavController> {
  BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: CustomSpeedDial(
          currentIndex: controller.currentIndex,
          onChatTap: () {
            Get.toNamed("/chatbot");
          },
          onScheduleTap: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => BottomAppBar(
          //comeback
          height: 68,
          shadowColor: AppColors.grey,
          //surfaceTintColor: AppColors.white,
          color: AppColors.white,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            // height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left side icons
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNavItem(
                      index: 0,
                      icon: 'assets/icons/home.svg',
                      label: 'Home',
                    ),
                    const SizedBox(width: 30),
                    _buildNavItem(
                      index: 1,
                      icon: AppAssets.book,
                      label: 'Journal',
                    ),
                  ],
                ),
                // Right side icons
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNavItem(
                      index: 3,
                      icon: AppAssets.profile,
                      label: 'Me',
                    ),
                    const SizedBox(width: 30),
                    _buildNavItem(
                      index: 4,
                      icon: AppAssets.menu,
                      label: 'More',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() => controller.pages[controller.currentIndex]),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String icon,
    required String label,
  }) {
    final isSelected = controller.currentIndex == index;

    return InkWell(
      onTap: () => controller.updateIndex(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
            height: 24,
            width: 24,
            color: isSelected ? AppColors.green : AppColors.grey,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.green : AppColors.grey,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSpeedDial extends StatelessWidget {
  final int currentIndex;
  final VoidCallback onChatTap;
  final VoidCallback onScheduleTap;

  const CustomSpeedDial({
    Key? key,
    required this.currentIndex,
    required this.onChatTap,
    required this.onScheduleTap,
  }) : super(key: key);

  bool get isActive => currentIndex == 2;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      // onPress: () {
      //   isActive = !isActive;
      // },
      activeBackgroundColor: AppColors.green,
      backgroundColor: isActive ? AppColors.green : AppColors.white,
      //  foregroundColor: isActive ? AppColors.white : AppColors.grey,
      elevation: 2,
      shape: const CircleBorder(),
      spacing: 12,

      childrenButtonSize: const Size(160, 48), // Fixed size for children
      children: [
        _buildSpeedDialChild(
          context: context,
          label: _buildRichText("Speak with ", "Mira"),
          icon: AppAssets.speak,
          onTap: onChatTap,
        ),
        _buildSpeedDialChild(
          context: context,
          label: Text(
            "Schedule a session",
            style: GoogleFonts.josefinSans(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          icon: AppAssets.star,
          onTap: onScheduleTap,
        ),
      ],
      child: _buildMainFabChild(currentIndex),
    );
  }

  SpeedDialChild _buildSpeedDialChild({
    required BuildContext context,
    required Widget label,
    required String icon,
    required VoidCallback onTap,
  }) {
    return SpeedDialChild(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      backgroundColor: Colors.white,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.45,
          minWidth: MediaQuery.of(context).size.width * 0.25,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              height: 16,
              width: 16,
            ),
            const SizedBox(width: 8.0),
            Flexible(child: label),
          ],
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildRichText(String prefix, String highlight) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: prefix,
            style: GoogleFonts.josefinSans(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: highlight,
            style: GoogleFonts.josefinSans(
              fontSize: 14,
              color: AppColors.blue,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildMainFabChild(int currentIndex) {
    print('isActive status: $isActive'); // Debug
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppAssets.messages,
          height: 22,
          color: isActive ? AppColors.grey : AppColors.white,
        ),
        const SizedBox(height: 4),
        Text(
          "Chats",
          style: GoogleFonts.josefinSans(
            fontSize: 14,
            color: isActive ? AppColors.grey : AppColors.white,
          ),
        ),
      ],
    );
  }
}
