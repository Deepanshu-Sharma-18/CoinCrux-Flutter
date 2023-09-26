import 'dart:async';
import 'package:coincrux/base/resizer/fetch_pixels.dart';
import 'package:coincrux/base/widget_utils.dart';
import 'package:coincrux/screens/dashboard/news_feed/model/news_model.dart';
import 'package:coincrux/screens/dashboard/news_feed/pages/feed_view.dart';
import 'package:timeago/timeago.dart' as timeago;
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
  CardSwiperController cardSwiperController = CardSwiperController();
  int currentType = 0;
  var isLoading = true;
  PageController pageCT = PageController();

  Timer? _appBarTimer;
  bool _isAppBarVisible = true;

  @override
  void dispose() {
    // _stopTimer();
    super.dispose();
  }

  @override
  void initState() {
    startLoadingTimer();
    super.initState();
  }

  void startLoadingTimer() {
    const loadingDuration =
        Duration(seconds: 2); // Adjust the duration as needed

    Timer(loadingDuration, () {
      setState(() {
        isLoading = false;
      });
    });
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

  @override
  Widget build(BuildContext context) {
    // String title = "Feed";
    List<NewsModel> newsList = Provider.of<NewsProvider>(context).newsList;
    final customImagesCount = (newsList.length / 5).floor;
    Future<void> _refreshData() async {
      setState(() {
        isLoading = true;
      });
      startLoadingTimer();
      await Provider.of<NewsProvider>(context, listen: false).listenToNews();
    }

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(_isAppBarVisible ? kToolbarHeight : 0),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200), // Adjust animation duration
            height: _isAppBarVisible ? kToolbarHeight : 0,
            child: AppBar(
              iconTheme: IconThemeData(
                color: R.colors.blackColor, //change your color here
              ),
              elevation: 0.0,
              backgroundColor: R.colors.bgColor,
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      _refreshData();
                    },
                    icon: Icon(Icons.refresh))
              ],
              title: Text(
                "My Feed",
                style: R.textStyle
                    .mediumLato()
                    .copyWith(fontSize: FetchPixels.getPixelHeight(17)),
              ),
            ),
          ),
        ),
        body: Container(
          color: R.colors.bgColor,
          child: Stack(children: [
            Positioned.fill(
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : GestureDetector(
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
                                    color: R.colors.bgColor,
                                    child: Stack(children: [
                                      Center(
                                          child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Container(
                                                height:
                                                    FetchPixels.getPixelHeight(
                                                        330),
                                                decoration: BoxDecoration(
                                                    image:
                                                        getDecorationNetworkImage(
                                                            context,
                                                            newsList[index -
                                                                    index ~/ 5]
                                                                .coinImage!,
                                                            fit: BoxFit.fill)),
                                                width: FetchPixels.width,
                                              ),
                                            ),
                                            getVerSpace(
                                                FetchPixels.getPixelHeight(15)),
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
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20.0),
                                              child: Text(
                                                newsList[index - index ~/ 5]
                                                    .coinHeading!,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: R.textStyle
                                                    .mediumLato()
                                                    .copyWith(
                                                        fontSize: FetchPixels
                                                            .getPixelHeight(20),
                                                        color: R
                                                            .colors.blackColor),
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
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Text(
                                                newsList[index - index ~/ 5]
                                                    .coinDescription!,
                                                textAlign: TextAlign.justify,
                                                maxLines: 12,
                                                overflow: TextOverflow.ellipsis,
                                                style: R.textStyle
                                                    .regularLato()
                                                    .copyWith(
                                                        wordSpacing: 3,
                                                        letterSpacing: 1,
                                                        fontSize: FetchPixels
                                                            .getPixelHeight(16),
                                                        color: R
                                                            .colors.blackColor),
                                              ),
                                            ),
                                            getVerSpace(
                                                FetchPixels.getPixelHeight(15)),

                                            Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20.0),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Crux by ${newsList[index - index ~/ 5].createdBy}",
                                                      style: R.textStyle
                                                          .regularLato()
                                                          .copyWith(
                                                              fontSize: FetchPixels
                                                                  .getPixelHeight(
                                                                      13),
                                                              color: R.colors
                                                                  .unSelectedIcon),
                                                    ),
                                                    SizedBox(
                                                      width: FetchPixels
                                                          .getPixelWidth(10),
                                                    ),
                                                    Icon(
                                                      Icons.circle,
                                                      color: R.colors
                                                          .unSelectedIcon,
                                                      size: FetchPixels
                                                          .getPixelHeight(8),
                                                    ),
                                                    SizedBox(
                                                      width: FetchPixels
                                                          .getPixelWidth(10),
                                                    ),
                                                    Text(
                                                      timeago.format(newsList[
                                                              index -
                                                                  index ~/ 5]
                                                          .createdAt!),
                                                      style: R.textStyle
                                                          .regularLato()
                                                          .copyWith(
                                                              fontSize: FetchPixels
                                                                  .getPixelHeight(
                                                                      11),
                                                              color: R.colors
                                                                  .unSelectedIcon),
                                                    ),
                                                    getHorSpace(FetchPixels
                                                        .getPixelWidth(1)),
                                                    getHorSpace(FetchPixels
                                                        .getPixelWidth(1)),
                                                    getHorSpace(FetchPixels
                                                        .getPixelWidth(1)),
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
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(15),
                                                  bottomLeft:
                                                      Radius.circular(15),
                                                ),
                                                border: Border.all(
                                                    color: Colors.amber)
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
                      )),
            )
          ]),
        ));
  }
}
