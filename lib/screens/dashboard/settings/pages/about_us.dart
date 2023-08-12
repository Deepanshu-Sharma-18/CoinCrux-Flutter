import 'package:flutter/material.dart';

import '../../../../base/resizer/fetch_pixels.dart';
import '../../../../base/widget_utils.dart';
import '../../../../resources/resources.dart';
class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.bgColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: R.colors.blackColor, //change your color here
        ),
        elevation: 0.0,
        backgroundColor: R.colors.bgColor,
        centerTitle: true,
        title: Text(
          "About Us",
          style: R.textStyle
              .mediumLato()
              .copyWith(fontSize: FetchPixels.getPixelHeight(17)),
        ),
      ),
      body: getPaddingWidget(
        EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
        ListView(children: [
          getVerSpace(FetchPixels.getPixelHeight(10)),
          Text(R.dummyData.longerText,style: R.textStyle.regularLato(),),
          getVerSpace(FetchPixels.getPixelHeight(10)),
          Text(R.dummyData.shortText,style: R.textStyle.regularLato(),),Text(R.dummyData.longerText,style: R.textStyle.regularLato(),),
          getVerSpace(FetchPixels.getPixelHeight(10)),
          Text(R.dummyData.shortText,style: R.textStyle.regularLato(),),
        ]),
      ),
    );
  }
}
