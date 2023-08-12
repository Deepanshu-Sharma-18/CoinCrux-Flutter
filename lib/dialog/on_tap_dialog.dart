import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../base/resizer/fetch_pixels.dart';
import '../base/widget_utils.dart';
import '../resources/resources.dart';
import '../widgets/my_button.dart';

class OnTapFunctionDialog extends StatefulWidget {
  final String headingText;
  final String text;
  final Function onTap;
  const OnTapFunctionDialog({
    Key? key,
    required this.headingText,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  State<OnTapFunctionDialog> createState() => _OnTapFunctionDialogState();
}

class _OnTapFunctionDialogState extends State<OnTapFunctionDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  var horSpace = FetchPixels.getPixelHeight(20);

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return ScaleTransition(
      alignment: Alignment.bottomCenter,
      scale: scaleAnimation,
      child: Dialog(
        insetPadding:
            EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(FetchPixels.getPixelHeight(22))),
        child: getPaddingWidget(
          EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(40)),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              getVerSpace(FetchPixels.getPixelHeight(30)),
              Text(
                widget.headingText,
                style: R.textStyle.mediumLato().copyWith(
                    fontSize: FetchPixels.getPixelHeight(30),
                    color: R.colors.blackColor),
              ),
              getVerSpace(FetchPixels.getPixelHeight(20)),
              getMultilineCustomFont(widget.text, 16, R.colors.unSelectedIcon,
                  fontWeight: FontWeight.w400,
                  txtHeight: FetchPixels.getPixelHeight(1.5),
                  textAlign: TextAlign.center),
              getVerSpace(FetchPixels.getPixelHeight(30)),
              MyButton(
                color: R.colors.unSelectedIcon,
                  onTap: () {
                    Get.back();
                  },
                  buttonText: "NO"),
              getVerSpace(FetchPixels.getPixelHeight(25)),
              MyButton(
                onTap: () {
                  Get.back();
                  widget.onTap();
                },
                buttonText: "YES",
                color: R.colors.theme,
              ),
              getVerSpace(FetchPixels.getPixelHeight(30)),
            ],
          ),
        ),
      ),
    );
  }
}
