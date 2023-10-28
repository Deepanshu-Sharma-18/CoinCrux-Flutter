import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:coincrux/screens/auth/provider/auth_provider.dart';
import 'package:coincrux/base/widget_utils.dart';
import 'package:coincrux/screens/dashboard/news_feed/provider/news_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:timeago/timeago.dart' as timeago;
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
  }

  @override
  Widget build(BuildContext context) {
    List<NewsModel> newsList = Provider.of<NewsProvider>(context)
        .newsList
        .where((element) => element.assetName == widget.coinName)
        .toList();
    final customImagesCount = (newsList.length / 5).floor;
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: R.colors.bgColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(_isAppBarVisible ? 100 : 0),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 20),
            height: _isAppBarVisible ? 100 : 0, // Animation duration
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
        body: GestureDetector(
            onTap: () {
              setState(() {
                _isAppBarVisible = !_isAppBarVisible;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: newsList.length > 5
                      ? newsList.length + customImagesCount()
                      : newsList.length,
                  itemBuilder: (ctx, index) {
                    if (newsList.isNotEmpty) {
                      return Container(
                          child: Stack(children: [
                        Center(
                            child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  height: FetchPixels.getPixelHeight(330),
                                  decoration: BoxDecoration(
                                      image: getDecorationNetworkImage(
                                          context,
                                          newsList[index - index ~/ 5]
                                              .coinImage!,
                                          fit: BoxFit.fill)),
                                  width: FetchPixels.width,
                                ),
                              ),
                              getVerSpace(FetchPixels.getPixelHeight(15)),
                              // Padding(
                              //   padding: const EdgeInsets.all(8),
                              // child:Container(
                              //   padding: EdgeInsets.symmetric(
                              //       horizontal: FetchPixels.getPixelWidth(17),
                              //       vertical: FetchPixels.getPixelHeight(6)),
                              //   decoration: BoxDecoration(
                              //       boxShadow: [
                              //         BoxShadow(
                              //             color: R.colors.fill.withOpacity(0.5),
                              //             spreadRadius: 2,
                              //             blurRadius: 2)
                              //       ],
                              //       color: R.colors.coinBoxColor,
                              //       borderRadius: BorderRadius.circular(
                              //           FetchPixels.getPixelHeight(5))),
                              //   child: Text(
                              //     newsList[index - index ~/ 5].assetName!,
                              //     style: R.textStyle.regularLato().copyWith(
                              //         fontSize: FetchPixels.getPixelHeight(13),
                              //         color: R.colors.unSelectedIcon),
                              //   ),
                              // )),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  newsList[index - index ~/ 5].coinHeading!,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: R.textStyle.mediumLato().copyWith(
                                      fontSize: FetchPixels.getPixelHeight(20),
                                      color: R.colors.blackColor),
                                ),
                              ),
                              //SizedBox(height: 5,),
                              // Flexible(
                              //   fit: FlexFit.loose,
                              //   child:Padding(
                              //     padding: EdgeInsets.symmetric(horizontal: 5),
                              //     child:
                              // Html(data: _newsList[index].articleDetails! ,style: {
                              //   "p" : Style(fontSize: FontSize.larger, maxLines: 10),
                              // },),)
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  newsList[index - index ~/ 5].coinDescription!,
                                  textAlign: TextAlign.justify,
                                  maxLines: 12,
                                  overflow: TextOverflow.ellipsis,
                                  style: R.textStyle.regularLato().copyWith(
                                      wordSpacing: 3,
                                      letterSpacing: 1,
                                      fontSize: FetchPixels.getPixelHeight(15),
                                      color: R.colors.blackColor),
                                ),
                              ),
                              getVerSpace(FetchPixels.getPixelHeight(15)),

                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Crux by ${newsList[index - index ~/ 5].createdBy}",
                                        style: R.textStyle
                                            .regularLato()
                                            .copyWith(
                                                fontSize:
                                                    FetchPixels.getPixelHeight(
                                                        13),
                                                color: R.colors.unSelectedIcon),
                                      ),
                                      SizedBox(
                                        width: FetchPixels.getPixelWidth(10),
                                      ),
                                      Icon(
                                        Icons.circle,
                                        color: R.colors.unSelectedIcon,
                                        size: FetchPixels.getPixelHeight(8),
                                      ),
                                      SizedBox(
                                        width: FetchPixels.getPixelWidth(10),
                                      ),
                                      Text(
                                        timeago.format(
                                            newsList[index - index ~/ 5]
                                                .createdAt!),
                                        style: R.textStyle
                                            .regularLato()
                                            .copyWith(
                                                fontSize:
                                                    FetchPixels.getPixelHeight(
                                                        11),
                                                color: R.colors.unSelectedIcon),
                                      ),
                                      getHorSpace(FetchPixels.getPixelWidth(1)),
                                      getHorSpace(FetchPixels.getPixelWidth(1)),
                                      getHorSpace(FetchPixels.getPixelWidth(1)),
                                    ],
                                  )),
                            ],
                          ),
                        )),
                        Positioned(
                            bottom: 0,
                            right: 1,
                            left: 1,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                  ),
                                  border: Border.all(color: Colors.amber)
                                  //color: Colors.amber
                                  ),
                            ))
                      ]));
                    } else {
                      return FittedBox(
                        child: Text('Empty'),
                      );
                    }
                  }),
            )));
  }
}
