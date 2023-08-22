import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coincrux/base/resizer/fetch_pixels.dart';
import 'package:coincrux/base/widget_utils.dart';
import 'package:coincrux/screens/dashboard/news_feed/model/news_model.dart';
import 'package:coincrux/screens/dashboard/news_feed/provider/news_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../resources/resources.dart';
import 'assets_page.dart';
import 'latest_news_view_all.dart';

class LatestView extends StatefulWidget {
  LatestView({super.key});

  @override
  State<LatestView> createState() => _LatestViewState();
}

class _LatestViewState extends State<LatestView> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  PageController pagePC = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, newsProvider, child) {
        return Scaffold(
          backgroundColor: R.colors.bgColor,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: R.colors.blackColor, //change your color here
            ),
            elevation: 0.0,
            backgroundColor: R.colors.bgColor,
            centerTitle: true,
            title: Text(
              "Home",
              style: R.textStyle
                  .mediumLato()
                  .copyWith(fontSize: FetchPixels.getPixelHeight(17)),
            ),
          ),
          body: Column(children: [
            SizedBox(
                height: FetchPixels.getPixelHeight(30),
                width: FetchPixels.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(2, (index) {
                    return heading(index);
                  }),
                )),
            getDivider(R.colors.fill.withOpacity(0.2),
                FetchPixels.getPixelHeight(10), FetchPixels.getPixelHeight(2)),
            getPaddingWidget(
              EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
              TextFormField(
                decoration:
                    R.decorations.textFormFieldDecoration(null, "Search"),
              ),
            ),
            getVerSpace(FetchPixels.getPixelHeight(10)),
            Expanded(
              child: PageView(
                controller: pagePC,
                onPageChanged: (page) {
                  currentPage = page;
                  setState(() {});
                },
                children: [
                  StreamBuilder(
                      stream: firebaseFirestore.collection('News').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<NewsModel> news = snapshot.data!.docs
                              .map((e) => NewsModel.fromJson(e.data()))
                              .toList();
                          List<NewsModel> freshNews = news.where((element) {
                            DateTime createdAt = element
                                .createdAt!; // Convert Firestore Timestamp to DateTime
                            DateTime currentTime = DateTime.now();
                            Duration difference =
                                currentTime.difference(createdAt);
                            int minutesDifference = difference.inMinutes;
                            return minutesDifference <=
                                120; // Fetch news created within the last 5 minutes
                          }).toList();
                          return ListView.builder(
                            itemCount: freshNews.length,
                            itemBuilder: (context, index) {
                              return getPaddingWidget(
                                  EdgeInsets.symmetric(
                                      horizontal:
                                          FetchPixels.getPixelWidth(20)),
                                  LatestViewAll(
                                    isNotification: false,
                                    news: freshNews[index],
                                    index: index,
                                  ));
                            },
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              color: R.colors.theme,
                            ),
                          );
                        }
                      }),
                  AssetsView(),
                ],
              ),
            ),
          ]),
        );
      },
    );
  }

  Widget heading(index) {
    return InkWell(
      onTap: () {
        currentPage = index;
        pagePC.animateToPage(currentPage,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
        setState(() {});
      },
      child: Column(
        children: [
          Text(
            index == 0 ? "Latest" : "Assets",
            style: R.textStyle.mediumLato().copyWith(
                fontSize: FetchPixels.getPixelHeight(16),
                color: currentPage == index ? R.colors.theme : R.colors.fill),
          ),
          getVerSpace(FetchPixels.getPixelHeight(5)),
          Container(
            color: currentPage == index ? R.colors.theme : R.colors.fill,
            height: FetchPixels.getPixelHeight(2),
            width: FetchPixels.getPixelWidth(150),
          )
        ],
      ),
    );
  }
}
