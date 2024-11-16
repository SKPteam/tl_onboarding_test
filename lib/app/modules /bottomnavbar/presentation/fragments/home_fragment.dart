import 'package:flutter/material.dart';
import 'package:flutter_firebase_test/app/modules%20/bottomnavbar/models/dto/dashboard_dto.dart';
import 'package:flutter_firebase_test/app/shared/constants/images.dart';
import 'package:flutter_firebase_test/core/framework/app_texts/apptexts.dart';
import 'package:flutter_firebase_test/core/framework/theme/colors/app_colors.dart';
import 'package:flutter_firebase_test/core/framework/theme/sizes/sizes.dart';
import 'package:flutter_firebase_test/core/framework/theme/spacing%20/spacing.dart';

import '../../../authentication/presentation/pages/login_screen.dart';

class HomeFragment extends StatefulWidget {
  HomeFragment({super.key, required this.dashboardDto});
  DashboardDto dashboardDto = DashboardDto();

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            Spacings.spacing24,
          ),
          child: (Column(
            children: [
              Row(
                children: [
                  Image.asset(Pngs.profile),
                  const SizedBox(
                    width: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        AppTexts.goodMorningText,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: TextSizes.size18,
                          color: AppColors.largeTextColor,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      // BlocConsumer<LoginBloc, LoginState>(
                      //   listener: (context, state) {},
                      //   builder: (context, state) {
                      //     if (state is LoginSuccess) {
                      //       final userData = state.userData;
                      //       dashboardDto.displayName =
                      //           userData['display_name'] ?? 'Unknown';
                      //       return Text(
                      //         dashboardDto.displayName ?? "Unknown",
                      //         style: const TextStyle(
                      //           fontWeight: FontWeight.w400,
                      //           fontSize: TextSizes.size20,
                      //           color: AppColors.largeTextColor,
                      //         ),
                      //       );
                      //     }
                      //     return const SizedBox();
                      //   },
                      // ),
                      Text(
                        dashboardDto.displayName ?? "Unknown",
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: TextSizes.size20,
                          color: AppColors.largeTextColor,
                        ),
                      ),
                      Text(
                        dashboardDto.userId.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: TextSizes.size20,
                          color: AppColors.largeTextColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
