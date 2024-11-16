import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_test/core/framework/app_texts/apptexts.dart';
import 'package:flutter_firebase_test/core/framework/theme/colors/app_colors.dart';
import 'package:flutter_firebase_test/core/framework/theme/spacing%20/spacing.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/framework/theme/sizes/sizes.dart';
import '../../../../shared/constants/images.dart';
import '../../domain/bloc/topic_bloc.dart';
import '../../domain/state/topic_state.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({super.key});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: Spacings.spacing12,
              horizontal: Spacings.spacing24,
            ),
            color: AppColors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(Svgs.label)),
                    const SizedBox(
                      width: Spacings.spacing12,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppTexts.mira,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: TextSizes.size18,
                            color: AppColors.largeTextColor,
                          ),
                        ),
                        Text(
                          AppTexts.miraDesc,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: TextSizes.size10,
                            color: AppColors.largeTextColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SvgPicture.asset(
                  Svgs.chatAdd,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: Spacings.spacing24,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: Spacings.spacing24,
              bottom: Spacings.spacing20,
            ),
            child: BlocBuilder<TopicBloc, TopicState>(
              builder: (context, state) {
                return Text(
                  state.selectedTopic == null
                      ? "No topic selected"
                      : "Topic: ${state.selectedTopic}",
                  style: const TextStyle(
                    fontSize: TextSizes.size14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blue,
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: Spacings.spacing20,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: Spacings.spacing24,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  Pngs.smallMira,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      Svgs.text,
                    ),
                    const SizedBox(
                      height: Spacings.spacing4,
                    ),
                    const Text(
                      AppTexts.mira,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: TextSizes.size8,
                        color: AppColors.smallTextColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
