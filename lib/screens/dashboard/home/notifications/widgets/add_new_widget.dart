import 'package:flutter/material.dart';

import '../../../../../base/resizer/fetch_pixels.dart';
import '../../../../../base/widget_utils.dart';
import '../../../../../resources/resources.dart';
class AddNewWidget extends StatefulWidget {
  const AddNewWidget({super.key});

  @override
  State<AddNewWidget> createState() => _AddNewWidgetState();
}

class _AddNewWidgetState extends State<AddNewWidget> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
      getDivider(R.colors.fill.withOpacity(0.5),
          FetchPixels.getPixelHeight(10), FetchPixels.getPixelHeight(1))
    ],);
  }
}
