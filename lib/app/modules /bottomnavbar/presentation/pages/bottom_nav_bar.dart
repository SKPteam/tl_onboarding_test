import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_test/app/modules%20/bottomnavbar/presentation/fragments/home_fragment.dart';
import 'package:flutter_firebase_test/app/modules%20/bottomnavbar/presentation/fragments/journal_fragment.dart';
import 'package:flutter_firebase_test/app/modules%20/bottomnavbar/state/create_chat_state.dart';
import 'package:flutter_firebase_test/app/modules%20/conversation/presentation/pages/select_topic_screen.dart';
import 'package:flutter_firebase_test/core/framework/app_texts/apptexts.dart';
import 'package:flutter_firebase_test/core/framework/theme/colors/app_colors.dart';
import 'package:flutter_firebase_test/core/framework/theme/sizes/sizes.dart';
import 'package:flutter_firebase_test/core/framework/theme/spacing%20/spacing.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shared/constants/images.dart';
import '../../bloc/create_chat_bloc.dart';
import '../../event/create_chat_even.dart';
import '../../models/dto/dashboard_dto.dart';
import '../fragments/more_fragment.dart';
import '../fragments/profile_fragment.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({
    super.key,
    this.dashboardDto,
  });

  DashboardDto? dashboardDto = DashboardDto();

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();
    print("this is user::${widget.dashboardDto!.displayName}");
  }

  void _showChatDialog(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          backgroundColor: AppColors.transparent,
          surfaceTintColor: AppColors.transparent,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(
                  Spacings.spacing16,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(
                    Spacings.spacing8,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Svgs.sas),
                    const SizedBox(
                      width: Spacings.spacing8,
                    ),
                    const Text(
                      AppTexts.sas,
                      style: TextStyle(
                        fontSize: TextSizes.size14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.smallTextColor,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: Spacings.spacing20,
              ),
              BlocConsumer<CreateChatBloc, CreateChatState>(
                listener: (context, state) {
                  if (state is CreateChatSuccess) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SelectTopicScreen(
                          name: widget.dashboardDto!.displayName ?? "",
                        ),
                      ),
                    );
                  } else if (state is CreateChatFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          backgroundColor: Colors.red,
                          content:
                              Center(child: Text('Error: ${state.error}'))),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is CreateChatLoading) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: AppColors.green,
                    ));
                  }
                  return GestureDetector(
                    onTap: () {
                      BlocProvider.of<CreateChatBloc>(context).add(
                        CreateChatRequested(
                          2,
                          widget.dashboardDto!.userId ?? 0,
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: Spacings.spacing20,
                      ),
                      padding: const EdgeInsets.all(
                        Spacings.spacing16,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(
                          Spacings.spacing8,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(Svgs.group),
                          const SizedBox(
                            width: Spacings.spacing8,
                          ),
                          const Text(
                            AppTexts.speakWithMira,
                            style: TextStyle(
                              fontSize: TextSizes.size14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.smallTextColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: Spacings.spacing20,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomeFragment(
            dashboardDto: widget.dashboardDto ?? DashboardDto(),
          ),
          const JournalFragment(),
          const ProfileFragment(),
          const MoreFragment(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(Spacings.spacing16),
            topRight: Radius.circular(Spacings.spacing16),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.gray.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              icon: Svgs.home,
              label: AppTexts.home,
              index: 0,
            ),
            _buildNavItem(
              icon: Svgs.book,
              label: AppTexts.journal,
              index: 1,
            ),
            const SizedBox(
              width: Spacings.spacing30,
            ),
            _buildNavItem(
              icon: Svgs.profile,
              label: AppTexts.me,
              index: 3,
            ),
            _buildNavItem(
              icon: Svgs.menu,
              label: AppTexts.more,
              index: 4,
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = 2;
          });
          _showChatDialog(context);
        },
        child: CircleAvatar(
          radius: 45,
          backgroundColor: AppColors.homeBackgroundColor,
          child: CircleAvatar(
            radius: 35,
            backgroundColor:
                _selectedIndex == 2 ? AppColors.green : AppColors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  _selectedIndex == 2 ? Svgs.whiteChat : Svgs.chat,
                  height: 24,
                  width: 24,
                ),
                const SizedBox(height: 4),
                Text(
                  AppTexts.chat,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: TextSizes.size12,
                    color: _selectedIndex == 2
                        ? AppColors.white
                        : AppColors.smallTextColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavItem(
      {required String icon, required String label, required int index}) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            color: _selectedIndex == index ? AppColors.green : AppColors.gray,
          ),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index ? AppColors.green : AppColors.gray,
              fontSize: TextSizes.size12,
            ),
          ),
        ],
      ),
    );
  }
}
