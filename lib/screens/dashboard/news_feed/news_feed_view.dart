import 'package:coincrux/base/resizer/fetch_pixels.dart';
import 'package:coincrux/base/widget_utils.dart';
import 'package:coincrux/screens/dashboard/news_feed/model/news_model.dart';
import 'package:coincrux/screens/dashboard/news_feed/pages/feed_view.dart';
import 'package:coincrux/screens/dashboard/news_feed/provider/news_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';
import '../../../resources/resources.dart';

class NewsFeedView extends StatefulWidget {
  NewsFeedView({
    Key? key,
  }) : super(key: key);

  @override
  State<NewsFeedView> createState() => _NewsFeedViewState();
}

class _NewsFeedViewState extends State<NewsFeedView> {
  PageController pageCT = PageController();
  int currentType = 0;
  CardSwiperController cardSwiperController = CardSwiperController();

  @override
  Widget build(BuildContext context) {
    bool isParentScaffoldVisible = true;
    // String title = "Feed";

    void updateParentScaffoldVisibility(bool isVisible) {
      setState(() {
        isParentScaffoldVisible = !isVisible;
        // title = "Fullscreen";
      });
    }

    List<NewsModel> newsList = Provider.of<NewsProvider>(context).newsList;
    return Scaffold(
        backgroundColor: R.colors.bgColor,
        appBar: isParentScaffoldVisible
            ? AppBar(
                iconTheme: IconThemeData(
                  color: R.colors.blackColor, //change your color here
                ),
                elevation: 0.0,
                backgroundColor: R.colors.bgColor,
                centerTitle: true,
                title: Text(
                  "Feed",
                  style: R.textStyle
                      .mediumLato()
                      .copyWith(fontSize: FetchPixels.getPixelHeight(17)),
                ),
              )
            : null,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(3, (index) {
                return newsType(index);
              }),
            ),
            getVerSpace(FetchPixels.getPixelHeight(10)),
            Expanded(
              child: PageView(
                controller: pageCT,
                onPageChanged: (page) {
                  currentType = page;
                  setState(() {});
                },
                physics: NeverScrollableScrollPhysics(),
                children: [
                  CardSwiper(
                    padding: EdgeInsets.only(left: 1),
                    isLoop: true,
                    controller: cardSwiperController,
                    allowedSwipeDirection: AllowedSwipeDirection.only(
                        right: false, left: false, down: true, up: true),
                    cardBuilder: (context, index) {
                      return FeedView(
                        news: newsList[index],
                        index: index,
                        onTapCallback: updateParentScaffoldVisibility,
                      );
                    },
                    cardsCount: newsList.length,
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget newsType(index) {
    return Column(
      children: [
        getVerSpace(FetchPixels.getPixelHeight(5)),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: FetchPixels.getPixelWidth(50),
            vertical: FetchPixels.getPixelHeight(2),
          ),
          decoration: BoxDecoration(
              color:
                  currentType == index ? R.colors.theme : R.colors.transparent,
              borderRadius:
                  BorderRadius.circular(FetchPixels.getPixelHeight(15))),
        )
      ],
    );
  }
}
