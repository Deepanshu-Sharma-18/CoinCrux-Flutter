import 'package:flutter/material.dart';

import '../../../../../base/resizer/fetch_pixels.dart';
import '../../../../../base/widget_utils.dart';
import '../../../../../resources/resources.dart';

class NotiWidget extends StatelessWidget {
  const NotiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getPaddingWidget(
          EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(5)),
          Row(
            children: [
              Container(
                height: FetchPixels.getPixelHeight(90),
                width: FetchPixels.getPixelWidth(140),
                decoration: BoxDecoration(
                    image: getDecorationAssetImage(context, R.images.bit,
                        fit: BoxFit.fill)),
              ),
              getHorSpace(FetchPixels.getPixelWidth(10)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getVerSpace(FetchPixels.getPixelHeight(10)),
                    Container(
                      decoration: BoxDecoration(
                          color: R.colors.bitcoinColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(
                              FetchPixels.getPixelHeight(5))),
                      padding: EdgeInsets.symmetric(
                        horizontal: FetchPixels.getPixelWidth(20),
                        vertical: FetchPixels.getPixelHeight(5),
                      ),
                      child: Text(
                        "Bitcoin",
                        style: R.textStyle.regularLato().copyWith(
                            fontSize: FetchPixels.getPixelHeight(15),
                            color: R.colors.bitcoinColor),
                      ),
                    ),
                    getVerSpace(FetchPixels.getPixelHeight(5)),
                    Text(
                      "The news comes here with a long heading.",
                      style: R.textStyle.regularLato().copyWith(
                          fontSize: FetchPixels.getPixelHeight(15),
                          color: R.colors.blackColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "19 min ago",
                          style: R.textStyle.regularLato().copyWith(
                              fontSize: FetchPixels.getPixelHeight(13),
                              color: R.colors.unSelectedIcon),
                        ),
                        getHorSpace(FetchPixels.getPixelWidth(1)),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        getDivider(R.colors.fill.withOpacity(0.5),
            FetchPixels.getPixelHeight(10), FetchPixels.getPixelHeight(1))
      ],
    );
  }
}
