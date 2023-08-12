import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timeago/timeago.dart' as timeAgo;
import '../../../../base/resizer/fetch_pixels.dart';
import '../../../../base/widget_utils.dart';
import '../../../../resources/resources.dart';
import '../../news_feed/model/news_model.dart';
import '../view_all_pages/stories_view.dart';
class StoriesWidget extends StatelessWidget {
  bool isAllView=false;
  int index;
  NewsModel news;
   StoriesWidget({Key? key,required this.index,required this.isAllView,required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getPaddingWidget(
      EdgeInsets.only(right: FetchPixels.getPixelWidth(10),),
      SizedBox( 
        width: FetchPixels.getPixelWidth(isAllView?150:90),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(FetchPixels.getPixelHeight(5)),
              decoration: BoxDecoration(
                border: Border.all(color: R.colors.borderColor),
                borderRadius:
                BorderRadius.circular(FetchPixels.getPixelHeight(10)),
              ),
              child: InkWell(
                onTap: (){
                  Get.to(StoriesView(coinsName: news.coinName!,));
                },
                child: Container(
                  height: FetchPixels.getPixelHeight(isAllView?200:120),
                  width: FetchPixels.getPixelWidth(isAllView?150:75),
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(FetchPixels.getPixelHeight(10)),
                      image: getDecorationNetworkImage(context, news.coinImage!,
                          fit: BoxFit.cover)),
                ),
              ),
            ),
            isAllView ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getVerSpace(FetchPixels.getPixelHeight(10)),
                Container(
                  decoration: BoxDecoration(
                      color: R.colors.theme.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(
                          FetchPixels.getPixelHeight(5))),
                  padding: EdgeInsets.symmetric(
                    horizontal: FetchPixels.getPixelWidth(15),
                    vertical: FetchPixels.getPixelHeight(5),
                  ),
                  child: Text(
                    news.coinName!,
                    style: R.textStyle.regularLato().copyWith(
                        fontSize: FetchPixels.getPixelHeight(12),
                        color: R.colors.theme),
                  ),
                ),
                getVerSpace(FetchPixels.getPixelHeight(5)),
                Text(
                  news.coinHeading!,
                  style: R.textStyle.mediumLato().copyWith(
                      fontSize: FetchPixels.getPixelHeight(15),
                      color: R.colors.blackColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      timeAgo.format(news.createdAt!),
                      style: R.textStyle.regularLato().copyWith(
                          fontSize: FetchPixels.getPixelHeight(11),
                          color: R.colors.unSelectedIcon),
                    ),

                    getHorSpace(FetchPixels.getPixelWidth(1)),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            FetchPixels.getPixelHeight(50)),
                      ),
                      elevation: 5,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(
                            FetchPixels.getPixelHeight(50)),
                        onTap: () {
                          Share.share(
                              'check out my Application https://example.com',
                              subject: 'Look what I made!');
                        },
                        child: Container(
                          padding:
                          EdgeInsets.all(FetchPixels.getPixelHeight(6)),
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Center(
                            child: Icon(
                              Icons.share,
                              color: R.colors.unSelectedIcon,
                              size: FetchPixels.getPixelHeight(15),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ):SizedBox(),

          ],
        ),
      ),
    );
  }
}
