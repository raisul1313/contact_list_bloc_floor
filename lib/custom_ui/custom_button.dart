import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onButtonPressed;
  final String buttonName;
  final double buttonWidth;
  final double buttonHeight;
  final double? textSize;
  final double paddingLeft;
  final double paddingRight;
  final double paddingTop;
  final double paddingBottom;
  final double marginLeft;
  final double marginRight;
  final double marginTop;
  final double marginBottom;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isEnable;

  CustomButton({
    required this.onButtonPressed,
    required this.buttonName,
    this.buttonHeight = 40,
    this.buttonWidth = 250,
    this.textSize = 15,
    this.paddingLeft = 0,
    this.paddingBottom = 0,
    this.paddingRight = 0,
    this.paddingTop = 0,
    this.marginLeft = 80,
    this.marginRight = 80,
    this.marginBottom = 0,
    this.marginTop = 0,
    this.backgroundColor,
    this.textColor,
    this.isEnable = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: buttonWidth,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        onPressed: isEnable ? () => onButtonPressed() : null,
        child:
            Text(buttonName, style: TextStyle(color: textColor, fontSize: textSize)),
      ),
    );
  }
}
