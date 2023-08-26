import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coincrux/base/resizer/fetch_pixels.dart';
import 'package:flutter/material.dart';

import '../../../../resources/resources.dart';
import '../../news_feed/model/news_model.dart';
import '../../news_feed/pages/feed_view.dart';

class TopicsView extends StatelessWidget {
  String coinsName;
  TopicsView({super.key, required this.coinsName});

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    void dummyFunction(bool isvisible){
      print("Hello");
    }
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0.00,
        backgroundColor: R.colors.bgColor,
        automaticallyImplyLeading: false,
        title: Text(
          coinsName,
          style: R.textStyle.mediumLato().copyWith(
              fontSize: FetchPixels.getPixelHeight(17),
              color: R.colors.blackColor),
        ),
      ),
      body: StreamBuilder(
          stream: firebaseFirestore
              .collection('News')
              .where('coinName', isEqualTo: coinsName)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<NewsModel> news = snapshot.data!.docs
                  .map((e) =>
                      NewsModel.fromJson(e.data() as Map<String, dynamic>))
                  .toList();
              return ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  return FeedView(
                    news: news[index],
                    index: index,
                    onTapCallback:dummyFunction,
                  );
                },
              );
            } else {
              return Center(
                child: SingleChildScrollView(),
              );
            }
          }),
    ));
  }
}
