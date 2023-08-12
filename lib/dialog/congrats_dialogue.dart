import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../base/resizer/fetch_pixels.dart';
import '../base/widget_utils.dart';
import '../resources/resources.dart';
import '../routes/app_routes.dart';

class CongratsDialogue extends StatefulWidget {
  final String text;
  final String image;

  const CongratsDialogue({Key? key,required this.text,required this.image}) : super(key: key);

  @override
  State<CongratsDialogue> createState() => _CongratsDialogueState();
}

class _CongratsDialogueState extends State<CongratsDialogue>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  Timer? timer;
  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      timer.cancel();
        Get.offAllNamed(Routes.loginView);
    }
    );
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
      scale: scaleAnimation,
      child: Dialog(
        backgroundColor: R.colors.whiteColor,
        insetPadding:
            EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(FetchPixels.getPixelHeight(22))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            getVerSpace(FetchPixels.getPixelHeight(30)),
            getAssetImage(widget.image,
            height: FetchPixels.getPixelHeight(100),
              width: FetchPixels.getPixelWidth(120)
            ),
            // getSvgImage("delete.svg"),
            // getVerSpace(FetchPixels.getPixelHeight(20)),
             Text("CONGRATULATIONS",style: R.textStyle.mediumLato().copyWith(color: R.colors.theme),),
             getVerSpace(FetchPixels.getPixelHeight(10)),
            getPaddingWidget(
              EdgeInsets.symmetric(horizontal: FetchPixels.getPixelHeight(64)),
              getMultilineCustomFont(
                  widget.text,
                  16,
                  Colors.black,
                  fontWeight: FontWeight.w600,
                  txtHeight: FetchPixels.getPixelHeight(1.5),
                  textAlign: TextAlign.center),
            ),

            getVerSpace(FetchPixels.getPixelHeight(30)),
          ],
        ),
      ),
    );
  }
}
