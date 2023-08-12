import 'package:coincrux/base/resizer/fetch_pixels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../base/widget_utils.dart';
import '../../../../../resources/resources.dart';

class PriceAlert extends StatefulWidget {
  PriceAlert({super.key});

  @override
  State<PriceAlert> createState() => _PriceAlertState();
}

class _PriceAlertState extends State<PriceAlert> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getVerSpace(FetchPixels.getPixelHeight(10)),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(FetchPixels.getPixelHeight(10)),
                  height: FetchPixels.getPixelHeight(40),
                  width: FetchPixels.getPixelWidth(40),
                  decoration: BoxDecoration(
                    color: R.colors.bgContainer,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: getAssetImage(R.images.bitLogo),
                ),
                getHorSpace(FetchPixels.getPixelWidth(10)),
                Text(
                  "Bitcoin",
                  style: R.textStyle
                      .mediumLato()
                      .copyWith(fontSize: FetchPixels.getPixelHeight(18)),
                ),
                getHorSpace(FetchPixels.getPixelWidth(5)),
                Text(
                  "(BTC)",
                  style: R.textStyle.mediumLato().copyWith(
                      fontSize: FetchPixels.getPixelHeight(16),
                      color: R.colors.fill),
                ),
                Spacer(),
                Switch(
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  value: isSwitched,
                  activeColor: R.colors.theme,
                  activeTrackColor: R.colors.theme.withOpacity(0.3),
                  inactiveThumbColor: R.colors.fill,
                  inactiveTrackColor: R.colors.fill.withOpacity(0.3),
                )
              ],
            ),
            getVerSpace(FetchPixels.getPixelHeight(5)),
            Text(
              "Out of range from ₹25,001 to  ₹27,400",
              style: R.textStyle
                  .mediumLato()
                  .copyWith(fontSize: FetchPixels.getPixelHeight(18)),
            ),
            getVerSpace(FetchPixels.getPixelHeight(10)),
            Text(
              "19:34    01 June 2023 ",
              style: R.textStyle.mediumLato().copyWith(
                  fontSize: FetchPixels.getPixelHeight(14),
                  color: R.colors.fill),
            ),
            getVerSpace(FetchPixels.getPixelHeight(10)),
          ],
        ),
        getDivider(R.colors.fill.withOpacity(0.5),
            FetchPixels.getPixelHeight(10), FetchPixels.getPixelHeight(1))
      ],
    );
  }
}
