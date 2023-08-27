import 'dart:async';
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
  bool _isAppBarVisible = true;
  Timer? _appBarTimer;
  CardSwiperController cardSwiperController = CardSwiperController();
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
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    // String title = "Feed";

    

    List<NewsModel> newsList = Provider.of<NewsProvider>(context).newsList;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_isAppBarVisible ? kToolbarHeight : 0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 20), // Animation duration
          height: _isAppBarVisible ? kToolbarHeight : 0,
          child:AppBar(
          iconTheme: IconThemeData(
            color: R.colors.blackColor, //change your color here
          ),
          elevation: 0.0,
          backgroundColor: R.colors.bgColor,
          centerTitle: true,
          title: Text(
            "My Feed",
            style: R.textStyle
                .mediumLato()
                .copyWith(fontSize: FetchPixels.getPixelHeight(17)),
          ),
        ),
        ),
      ),
      body:GestureDetector(
        onTap:_resetTimer,
        child:Container(
        child: Column(
      children: [
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
                  );
                },
                cardsCount: newsList.length,
              ),
            ],
          ),
        ),
      ],
    ))));
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
