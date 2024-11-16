import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_test/app/modules%20/bottomnavbar/presentation/pages/bottom_nav_bar.dart';
import 'package:flutter_firebase_test/app/modules%20/conversation/presentation/pages/conversation_screen.dart';
import 'package:flutter_firebase_test/app/shared/presentation/widgets/components/button_component.dart';
import 'package:flutter_firebase_test/core/framework/app_texts/apptexts.dart';
import 'package:flutter_firebase_test/core/framework/theme/colors/app_colors.dart';
import 'package:flutter_firebase_test/core/framework/theme/sizes/sizes.dart';
import 'package:flutter_firebase_test/core/framework/theme/spacing%20/spacing.dart';

import '../../../../shared/constants/images.dart';
import '../../../bottomnavbar/models/dto/dashboard_dto.dart';
import '../../domain/bloc/topic_bloc.dart';
import '../../domain/event/topic_event.dart';
import '../../domain/state/topic_state.dart';
import '../../widget/reusable_select_topic_container.dart';

class SelectTopicScreen extends StatefulWidget {
  SelectTopicScreen({super.key, required this.name});
  String name;
  @override
  State<SelectTopicScreen> createState() => _SelectTopicScreenState();
}

DashboardDto dashboardDto = DashboardDto();

int? selectedContainer;
String topicName = "";

class _SelectTopicScreenState extends State<SelectTopicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            Spacings.spacing24,
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              Pngs.miraProfile,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            const Text(
                              AppTexts.mira,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: TextSizes.size18,
                                color: AppColors.largeTextColor,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<TopicBloc>().add(ResetTopicEvent());
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => BottomNavBar()));
                          },
                          child: const Icon(
                            Icons.close,
                            color: AppColors.largeTextColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: Spacings.spacing24,
                    ),
                    Text(
                      "Hi,${widget.name}. I’m Mira, your virtual wellness coach, here to listen, guide, and help you find balance in your daily life. Reach out whenever you’re ready and I’ll be ready to assist",
                      style: const TextStyle(
                        fontSize: TextSizes.size14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.largeTextColor,
                      ),
                    ),
                    const SizedBox(
                      height: Spacings.spacing20,
                    ),
                    const Text(
                      "Pick a topic you’d like to talk about, and lets get started",
                      style: TextStyle(
                        fontSize: TextSizes.size14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.largeTextColor,
                      ),
                    ),
                    const SizedBox(
                      height: Spacings.spacing20,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(
                          Spacings.spacing20,
                        ),
                        child: BlocBuilder<TopicBloc, TopicState>(
                          builder: (context, state) {
                            return Wrap(
                              spacing:
                                  12.0, // space between containers horizontally
                              runSpacing:
                                  12.0, // space between containers vertically
                              children: List.generate(topics.length, (index) {
                                return ReusableSelectTopicContainer(
                                  text: topics[index],
                                  isSelected: state.selectedContainer == index,
                                  containerNumber: index,
                                  onTap: () {
                                    BlocProvider.of<TopicBloc>(context).add(
                                      SelectTopicEvent(
                                          selectedContainer: index,
                                          selectedTopic: topics[index]),
                                    );
                                  },
                                );
                              }),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<TopicBloc, TopicState>(
                builder: (context, state) {
                  return CustomButton(
                    text: AppTexts.continueText,
                    validator: () => state.selectedTopic != null,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ConversationScreen(),
                        ),
                      );
                    },
                    expanded: true,
                  );
                },
              ),
              const SizedBox(
                height: Spacings.spacing20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: Spacings.spacing20,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "Check out our ",
                    style: TextStyle(
                      color: AppColors.largeTextColor,
                      fontSize: TextSizes.size14,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: "T&Cs",
                        style: TextStyle(
                          color: AppColors.green,
                          fontWeight: FontWeight.w400,
                          fontSize: TextSizes.size16,
                        ),
                      ),
                      TextSpan(
                        text: ", and ",
                        style: TextStyle(
                          color: AppColors.largeTextColor,
                          fontWeight: FontWeight.w400,
                          fontSize: TextSizes.size14,
                        ),
                      ),
                      TextSpan(
                        text: "privacy policies",
                        style: TextStyle(
                          color: AppColors.green,
                          fontWeight: FontWeight.w400,
                          fontSize: TextSizes.size14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final List<String> topics = [
    'Anxiety',
    'Job/Career/Workplace',
    'Trauma',
    'Stress management',
    'Sleep',
    'Mental blocks',
  ];
}
