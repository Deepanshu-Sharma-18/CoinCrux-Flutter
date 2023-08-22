import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coincrux/base/resizer/fetch_pixels.dart';
import 'package:coincrux/base/widget_utils.dart';
import 'package:coincrux/screens/auth/provider/auth_provider.dart';
import 'package:coincrux/screens/dashboard/news_feed/model/news_model.dart';
import 'package:coincrux/screens/dashboard/news_feed/pages/feed_view.dart';
import 'package:coincrux/screens/dashboard/news_feed/provider/news_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Consumer2<NewsProvider, AuthProvider>(
      builder: (context, newsProvider, authProvider, child) {
        List<NewsModel> newsList = Provider.of<NewsProvider>(context).newsList;
        return Column(
          children: [
            authProvider.isFeedView == true
                ? SizedBox()
                : Row(
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
                        right: false, left: false, down: false, up: true),
                    cardBuilder: (context, index) {
                      return FeedView(
                        news: newsList[index],
                            
                        index: index,
                      );
                    },
                    cardsCount: newsList.length,
                  ),

                  CardSwiper(
                    padding: EdgeInsets.only(left: 1),
                    isLoop: true,
                    controller: cardSwiperController,
                    allowedSwipeDirection: AllowedSwipeDirection.only(
                        right: false, left: false, down: false, up: true),
                    cardBuilder: (context, index) {
                      return FeedView(
                        news: newsList[index],
                        index: index,
                      );
                    },
                    cardsCount: newsList.length,
                  ),

                  CardSwiper(
                    padding: EdgeInsets.only(left: 0.5),
                    isLoop: true,
                    controller: cardSwiperController,
                    allowedSwipeDirection: AllowedSwipeDirection.only(
                        right: false, left: false, down: false, up: true),
                    cardBuilder: (context, index) {
                      return FeedView(
                        news: newsList[index],
                        index: index,
                      );
                    },
                    cardsCount: newsList.length,
                  ),

                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget newsType(index) {
    return  Column(
        children: [
          getVerSpace(FetchPixels.getPixelHeight(5)),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: FetchPixels.getPixelWidth(50),
              vertical: FetchPixels.getPixelHeight(2),
            ),
            decoration: BoxDecoration(
                color: currentType == index
                    ? R.colors.theme
                    : R.colors.transparent,
                borderRadius:
                    BorderRadius.circular(FetchPixels.getPixelHeight(15))),
          )
        ],
    );
  }
}
