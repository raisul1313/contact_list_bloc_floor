import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String headerName;
  final double marginTop;
  final double marginBottom;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final double marginLeft;
  final double marginRight;
  final int? maxLine;

  CustomHeader({
    required this.headerName,
    this.marginTop = 0,
    this.marginBottom = 0,
    this.fontSize = 17,
    this.fontWeight = FontWeight.w600,
    this.color = Colors.purple,
    this.textAlign,
    this.marginLeft = 0,
    this.marginRight = 0,
    this.maxLine
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: marginLeft,
        right: marginRight,
      ),
      child: Column(
        children: [
          SizedBox(height: marginTop),
          Text(
            headerName,
            style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight
            ),
            maxLines: maxLine,
            textAlign: textAlign,
          ),
          SizedBox(height: marginBottom),
        ],
      ),
    );
  }
}
