import 'package:coincrux/screens/dashboard/home/view_all_pages/topics_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../base/resizer/fetch_pixels.dart';
import '../../../../base/widget_utils.dart';
import '../../../../resources/resources.dart';

class TopicsWidget extends StatelessWidget {
  int index;
  String coinsName;
  String coinsImage;
  TopicsWidget({Key? key, required this.index,required this.coinsName,required this.coinsImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(TopicsView(coinsName: coinsName));
      },
      child: getPaddingWidget(
        EdgeInsets.only(right: FetchPixels.getPixelWidth(8)),
        Column(
          children: [
            Container(
              height: FetchPixels.getPixelHeight(85),
              width: FetchPixels.getPixelWidth(75),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(FetchPixels.getPixelHeight(10)),
                  image: getDecorationNetworkImage(context, coinsImage,
                      fit: BoxFit.cover)),
            ),
            getVerSpace(FetchPixels.getPixelHeight(5)),
            Text(
              coinsName,
              style: R.textStyle.regularLato().copyWith(
                  fontSize: FetchPixels.getPixelHeight(14),
                  color: R.colors.unSelectedIcon),
            )
          ],
        ),
      ),
    );
    ;
  }
}
