import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../base/resizer/fetch_pixels.dart';
import '../../../../base/widget_utils.dart';
import '../../../../resources/resources.dart';
import '../category_details/coin_category_view.dart';
import 'package:coincrux/screens/dashboard/news_feed/model/news_model.dart';

class PriceAnalysis extends StatelessWidget {
  final NewsModel newsModel;
  final int index;
  final int currentImage;

  PriceAnalysis({
    required this.newsModel,
    required this.index,
    required this.currentImage,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive =
        index == currentImage; // Determine if this card is active

    return InkWell(
      onTap: () {
        Get.to(CoinCategoryView(
          coinName: newsModel.assetName!,
        ));
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300), // Duration for animation
        padding: EdgeInsets.all(FetchPixels.getPixelHeight(10)),
        margin: EdgeInsets.all(FetchPixels.getPixelWidth(5)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(8)),
          border: Border.all(color: R.colors.theme, width: 0.4),
          color: isActive
              ? Colors.white
              : Color(0xfff8f8fc), // Change color based on isActive
        ),
        child: Row(
          children: [
            Container(
              width: FetchPixels.width / 2.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: FetchPixels.getPixelHeight(70),
                    width: FetchPixels.width,
                    decoration: BoxDecoration(
                      image: getDecorationNetworkImage(
                        context,
                        newsModel.coinImage!,
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                  getPaddingWidget(
                    EdgeInsets.all(FetchPixels.getPixelWidth(5)),
                    Text(
                      newsModel.coinHeading!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: R.textStyle.mediumLato().copyWith(
                            fontSize: FetchPixels.getPixelHeight(14),
                            color: isActive
                                ? R.colors.headings
                                : R.colors.darkBlue, // Adjust text color
                          ),
                    ),
                  ),
                  getVerSpace(FetchPixels.getPixelHeight(1)),
                ],
              ),
            ),
            Expanded(
              child: getAssetImage(
                R.images.graph,
                boxFit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
