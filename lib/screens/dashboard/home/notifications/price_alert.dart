import 'package:coincrux/base/resizer/fetch_pixels.dart';
import 'package:coincrux/screens/dashboard/home/notifications/widgets/price_alert_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../resources/resources.dart';
import 'add_new_alert.dart';
class PriceAlertPage extends StatelessWidget {
  const PriceAlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
            return PriceAlert();
          },),
        ),
        InkWell(
          onTap: () {
            Get.to(AddNewAlert());
          },
          child: Container(
            margin: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(20)),
            height: FetchPixels.getPixelHeight(50),
            width: FetchPixels.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(10)),
              border: Border.all(width: 1,color: R.colors.theme)

            ),
            child: Center(child: Text("+ Add new price alert",style: R.textStyle.mediumLato().copyWith(color: R.colors.theme),))
          ),
        )
      ],
    );
  }
}
