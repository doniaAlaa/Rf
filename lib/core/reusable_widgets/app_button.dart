import 'package:flutter/material.dart';
import 'package:test2/core/const/app_colors.dart';

class PrimaryAppButton extends StatelessWidget {
  final double? buttonHeight;
  final double? buttonWidth;
  final String buttonTile;
  final TextStyle? buttonTitleStyle;
  final Color? buttonColor;
  final double? buttonRadius;
  final BoxBorder? btnBorder;
  final Function() onPress;

  const PrimaryAppButton(
      {super.key,
      this.buttonHeight,
      this.buttonWidth,
      required this.buttonTile,
      required this.onPress,
      this.buttonColor,
      this.buttonTitleStyle,
      this.btnBorder,
      this.buttonRadius, });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: SizedBox(
        height: buttonHeight ?? 48,
        width: buttonWidth ?? MediaQuery.of(context).size.width - 32,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: buttonColor ?? AppColors.primaryColor,
              border: btnBorder,
              borderRadius:
                  BorderRadius.all(Radius.circular(buttonRadius ?? 16))),
          child: Center(
            child: Text(
              buttonTile,
              style: buttonTitleStyle ??
                  const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
