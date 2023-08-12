import 'package:flutter/material.dart';

import '../base/resizer/fetch_pixels.dart';
import '../base/widget_utils.dart';
import '../resources/resources.dart';

class MyButton extends StatefulWidget {
  final Function onTap;
  final String buttonText;
  final bool isPrefixIcon;
  final Color? color;
  final Color? blackColor;
  final double? height;
  final double? width;

  MyButton(
      {required this.onTap,
      required this.buttonText,
      this.blackColor,
      this.isPrefixIcon = false,
      this.color,
      this.height,
      this.width});
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(35),
      onTap: () {
        widget.onTap();
      },
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
        height: widget.height ?? FetchPixels.getPixelHeight(50),
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(10)),
          border: Border.all(color: R.colors.whiteColor,width: 1),
        color: widget.color ?? R.colors.theme
        ),
        child: Center(
          child: Text(
            widget.buttonText,
            style: R.textStyle
                .mediumLato()
                .copyWith(color: R.colors.whiteColor),
          ),
        ),
      ),
    );

  }
}
