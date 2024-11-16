import 'package:flutter/cupertino.dart';

import '../../../../core/framework/theme/colors/app_colors.dart';
import '../../../../core/framework/theme/sizes/sizes.dart';
import '../../../../core/framework/theme/spacing /spacing.dart';

class ReusableSelectTopicContainer extends StatefulWidget {
  ReusableSelectTopicContainer({
    super.key,
    required this.text,
    required this.isSelected,
    required this.containerNumber,
    required this.onTap,
  });
  String text;
  bool isSelected;
  int containerNumber;
  Function() onTap;

  @override
  State<ReusableSelectTopicContainer> createState() =>
      _ReusableSelectTopicContainerState();
}

class _ReusableSelectTopicContainerState
    extends State<ReusableSelectTopicContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: widget.isSelected ? AppColors.green : AppColors.lightGreen,
          borderRadius: BorderRadius.circular(
            Spacings.spacing16,
          ),
          border: Border.all(
            width: 1,
            color: AppColors.textFieldBorderColor,
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: TextSizes.size12,
            color:
                widget.isSelected ? AppColors.white : AppColors.largeTextColor,
          ),
        ),
      ),
    );
  }
}
