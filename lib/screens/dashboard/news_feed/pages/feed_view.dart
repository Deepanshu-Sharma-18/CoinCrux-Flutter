import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coincrux/base/resizer/fetch_pixels.dart';
import 'package:coincrux/screens/auth/provider/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../model/news_model.dart';
// import '../news_detail_page.dart';
import '../widgets/news_feed_widget.dart';
import 'graph_view.dart';

class FeedView extends StatefulWidget {
  final NewsModel news;
  int? index;
  FeedView(
      {Key? key, required this.news, this.index,})
      : super(key: key);

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  PageController pCtr = PageController();

  int p = 0;
  bool fullScreen = false;
  bool check = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // AuthProvider authProvider = Provider.of(context, listen: false);
    return Container(
      height: FetchPixels.height * 0.8,
      width: FetchPixels.width,
      child: PageView(
        physics: 
            // NeverScrollableScrollPhysics()
            AlwaysScrollableScrollPhysics(),
        controller: pCtr,
        // onPageChanged: (page) {
        //   p = page;
        //   if (p == 1) {
        //     print("Enter in one");
        //     Get.to(() => GraphView(
        //           news: widget.news,
        //           isGraphCheck: true,
        //         ));
        //     setState(() {});
        //     var c = Provider.of<AuthProvider>(context, listen: false);
        //     c.cryptoModelList.clear();
        //     c.cryptoModeWeeklyList.clear();
        //     c.cryptoModelMonthlyList.clear();
        //     c.candleList.clear();
        //     c.candleListWeekly.clear();
        //     c.candleListMonthly.clear();
        //     c.update();
        //     c.getDataFromAPI(widget.news.assetName!);
        //     p = 0;
        //     pCtr.jumpToPage(0);
        //   }
        // },
        children: [
          InkWell(
              onTap: () {
                  
              },
              child: MyNewsFeedWidget(
                isDetailed: false, news: widget.news, index: widget.index!)),
        ],
      ),
    );
  }
}
