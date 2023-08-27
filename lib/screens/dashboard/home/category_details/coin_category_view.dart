import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:coincrux/screens/auth/provider/auth_provider.dart';
import 'package:coincrux/screens/dashboard/news_feed/provider/news_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';
import '../../../../base/resizer/fetch_pixels.dart';
import '../../../../resources/resources.dart';
import '../../news_feed/model/news_model.dart';
import '../../news_feed/pages/feed_view.dart';

class CoinCategoryView extends StatefulWidget {
  String coinName;
  CoinCategoryView({super.key, required this.coinName});

  @override
  State<CoinCategoryView> createState() => _CoinCategoryViewState();
}

class _CoinCategoryViewState extends State<CoinCategoryView> {
  CardSwiperController cardSwiperController = CardSwiperController();
  bool _isAppBarVisible = true;
  Timer? _appBarTimer;
  void _startTimer() {
    _appBarTimer = Timer(Duration(milliseconds: 1000), () {
      setState(() {
        _isAppBarVisible = false;
      });
    });
  }

  void _stopTimer() {
    _appBarTimer?.cancel();
  }

  void _resetTimer() {
    if (!_isAppBarVisible) {
      setState(() {
        _isAppBarVisible = true;
      });
      _stopTimer();
      _startTimer();
    }
  }

  @override
  void initState() {
    print("${widget.coinName}");
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<NewsProvider, AuthProvider>(
      builder: (context, newsProvider, auth, child) {
        List<NewsModel> newsList = Provider.of<NewsProvider>(context)
            .newsList
            .where((element) => element.assetName == widget.coinName)
            .toList();

        return Scaffold(
            backgroundColor: R.colors.bgColor,
            appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(_isAppBarVisible ? kToolbarHeight : 0),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 20), // Animation duration
                height: _isAppBarVisible ? kToolbarHeight : 0,
                child: AppBar(
                  iconTheme: IconThemeData(
                    color: R.colors.blackColor, //change your color here
                  ),
                  elevation: 0.0,
                  automaticallyImplyLeading: true,
                  backgroundColor: R.colors.bgColor,
                  centerTitle: true,
                  title: Text(
                    widget.coinName,
                    style: R.textStyle
                        .mediumLato()
                        .copyWith(fontSize: FetchPixels.getPixelHeight(17)),
                  ),
                ),
              ),
            ),
            body: CardSwiper(
                padding: EdgeInsets.only(left: 1),
                isLoop: true,
                controller: cardSwiperController,
                allowedSwipeDirection: AllowedSwipeDirection.only(
                    right: false, left: false, down: true, up: true),
                cardBuilder: (context, index) {
                  return FeedView(
                    news: newsList[index],
                    index: index,
                    newsList: newsList,
                  );
                },
                cardsCount: newsList.length)
            //   ListView.builder(
            //   itemCount: firebaseAuth.currentUser == null || auth.userM.topics!.isEmpty ? news.length : userNews.length,
            //   itemBuilder: (context, index) {
            //     return FeedView(news: firebaseAuth.currentUser == null || auth.userM.topics!.isEmpty ? news[index] : userNews[index],index: index,);
            //   },
            // );

            );
      },
    );
  }
}
