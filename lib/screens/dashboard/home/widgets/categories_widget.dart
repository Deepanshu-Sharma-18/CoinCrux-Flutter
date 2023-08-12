import 'package:coincrux/screens/dashboard/home/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../base/resizer/fetch_pixels.dart';
import '../../../../base/widget_utils.dart';
import '../../../../resources/resources.dart';
import '../../dashboard_view.dart';
import '../category_details/coin_category_view.dart';

class CategoriesWidget extends StatelessWidget {
  final CategoryModel model;
  int index;
  CategoriesWidget({Key? key, required this.index, required this.model})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(CoinCategoryView(
          coinName: model.coinName!,
        ));
      },
      child: Container(
        padding: EdgeInsets.all(FetchPixels.getPixelHeight(5)),
        height: FetchPixels.getPixelHeight(70),
        width: FetchPixels.getPixelWidth(70),
        decoration: BoxDecoration(
          color: R.colors.tilesColor,
          borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(5)),
        ),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            padding: EdgeInsets.all(FetchPixels.getPixelHeight(4)),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: getAssetImage(
              model.coinLogo!,
              height: FetchPixels.getPixelHeight(30),
              width: FetchPixels.getPixelWidth(30),
            ),
          ),
          Expanded(
            child: Text(
              model.coinName!,
              style: R.textStyle.regularLato().copyWith(
                  fontSize: FetchPixels.getPixelHeight(14),
                  color: R.colors.blackColor),
            ),
          )
        ]),
      ),
    );
  }
}
