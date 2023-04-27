import 'package:flutter/material.dart';
import 'package:travo_app_demo/core/constants/color_constants.dart';
import 'package:travo_app_demo/core/constants/dismension_constants.dart';
import 'package:travo_app_demo/core/constants/textstyle_constants.dart';

class ButtonPrimaryWidget extends StatelessWidget {
  const ButtonPrimaryWidget(
      {super.key, required this.title, required this.ontap});
  final String title;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => {ontap()},
      child: Container(
        decoration: BoxDecoration(
            gradient: GradientPalette.defaultGradient,
            borderRadius: BorderRadius.circular(999)),
        child: Padding(
          padding: const EdgeInsets.only(
              left: distanceDefault * 4,
              right: distanceDefault * 4,
              top: distanceDefault + 2,
              bottom: distanceDefault + 2),
          child: Column(
            children: [
              Text(
                title,
                style: AppStyle.mediumText
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
