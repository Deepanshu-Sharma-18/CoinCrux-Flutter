
import 'package:cloud_firestore/cloud_firestore.dart';
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
   CoinCategoryView({super.key,required this.coinName});

  @override
  State<CoinCategoryView> createState() => _CoinCategoryViewState();
}

class _CoinCategoryViewState extends State<CoinCategoryView> {
   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

   FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    CardSwiperController cardSwiperController = CardSwiperController();

    @override
  void initState() {
    print("${widget.coinName}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<NewsProvider,AuthProvider>(builder: (context, newsProvider,auth, child) {
    return Scaffold(
      backgroundColor: R.colors.bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
          color: R.colors.blackColor, //change your color here
        ),
        elevation: 0.0,
        backgroundColor: R.colors.bgColor,
        centerTitle: true,
        title: Text(
          widget.coinName,
          style: R.textStyle
              .mediumLato()
              .copyWith(fontSize: FetchPixels.getPixelHeight(17)),
        ),
      ),
      body: StreamBuilder(
          stream: firebaseFirestore.collection('News').where('coinType',isEqualTo: widget.coinName).snapshots(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              List<NewsModel> news = snapshot.data!.docs.map((e) => NewsModel.fromJson(e.data() as Map<String,dynamic>)).toList();
              List<NewsModel> userNews = [];
              if(auth.userM.topics != null){
                userNews = news.where((newsItem) =>
                    auth.userM.topics!.any((topic) => newsItem.coinName == topic.name)
                ).toList();
              }
              return CardSwiper(
                padding: EdgeInsets.only(left: 1),
                isLoop: true,
                controller: cardSwiperController,
                allowedSwipeDirection: AllowedSwipeDirection.only(right: false,left: false,down: false,up: true),
                cardBuilder: (context, index) {
                  return FeedView(news: firebaseAuth.currentUser == null || auth.userM.topics!.isEmpty ? news[index] : userNews[index],index: index,);
                },
                cardsCount: firebaseAuth.currentUser == null || auth.userM.topics!.isEmpty ? news.length : userNews.length,);
              //   ListView.builder(
              //   itemCount: firebaseAuth.currentUser == null || auth.userM.topics!.isEmpty ? news.length : userNews.length,
              //   itemBuilder: (context, index) {
              //     return FeedView(news: firebaseAuth.currentUser == null || auth.userM.topics!.isEmpty ? news[index] : userNews[index],index: index,);
              //   },
              // );
            }else{
              return Center(child: SingleChildScrollView(),);
            }
          }),
      ); },);
  }
}
