import 'package:flutter/material.dart';
import 'package:flutter_firebase_test/core/app_widgets/app_button.dart';
import 'package:flutter_firebase_test/core/constants/app_assets.dart';
import 'package:flutter_firebase_test/core/constants/app_colors.dart';
import 'package:flutter_firebase_test/core/constants/extensions/extensions.dart';
import 'package:flutter_firebase_test/data/models/create_chat.dart';
import 'package:flutter_firebase_test/data/repositories/chat.dart';
import 'package:flutter_firebase_test/presentation/home/bottom_nav/bottom_nav.dart';
import 'package:flutter_firebase_test/presentation/home/chats/chat_controller.dart';
import 'package:flutter_firebase_test/presentation/home/chats/widgets/suggestion_chips.dart';
import 'package:flutter_firebase_test/presentation/home/chats/widgets/suggestion_chips_controler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Chats extends GetView<ChatController> {
  // final CreateChat chat;
  final SuggestionChipsController control =
      Get.put(SuggestionChipsController()); // Initialize controller

  final List<String> chipTitles = [
    "Anxiety",
    "Job/Career/Workplace",
    "Trauma",
    "Stress management",
    "Sleep",
    "Mental blocks",
  ];

  Chats({
    super.key,
    // required this.chat
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24.0),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppAssets.logo))),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      "Mira",
                      style: GoogleFonts.josefinSans(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                GestureDetector(
                    onTap: () {
                      Get.to(BottomNav());
                    },
                    child: SvgPicture.asset(AppAssets.cancel))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Obx(() {
              if (controller.state.status == ChatStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.state.status == ChatStatus.error) {
                return Center(
                  child: Text(
                      controller.state.errorMessage ?? 'An error occurred'),
                );
              }

              return Text('C');

              //   return ListView.builder(
              //     itemCount: controller.chats.length,
              //     itemBuilder: (context, index) {
              //       final chat = controller.chats[index];
              //       return ListTile(
              //         title: Text('Chat ${chat.id}'),
              //         subtitle:
              //             Text('With consultant: ${chat.consultant?.fName}'),
              //       );
              //     },
              //   );
            }),
            Wrap(
                spacing: 10,
                runSpacing: 20,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: List.generate(chipTitles.length, (index) {
                  return Obx(() => SuggestionChips(
                      onTap: () {
                        control.updateSelectedChip(index);
                      },
                      isSelected: control.selectedChipIndex.value == index,
                      title: chipTitles[index]));
                })),
            const SizedBox(
              height: 200,
            ),
            PrimaryButton(
              onPressed: () {},
              width: size.width,
              backgroundColor: AppColors.green,
              text: "Continue",
              textColor: AppColors.textWhite,
            ).padding(padding: const EdgeInsets.only(bottom: 40)),
            const SizedBox(
              height: 16,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: "Check out our ",
                style: GoogleFonts.josefinSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: "T&Cs, ",
                style: GoogleFonts.josefinSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.green),
              ),
              TextSpan(
                text: "and ",
                style: GoogleFonts.josefinSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: "privacy policies",
                style: GoogleFonts.josefinSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.green),
              )
            ]))
          ],
        ),
      )),
    );
  }
}

class SelectableItems<T> {
  bool isSelected = false; //Selection property to highlight or not
  T data; //Data of the user
  SelectableItems(this.data); //Constructor to assign the data
}
