import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coincrux/base/widget_utils.dart';
import 'package:coincrux/screens/auth/provider/auth_provider.dart';
import 'package:coincrux/screens/dashboard/home/view_all_pages/topics_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../../base/resizer/fetch_pixels.dart';
import '../../../../resources/resources.dart';
import '../../news_feed/model/news_model.dart';
import '../category_details/coin_category_view.dart';

class CategoriesViewAll extends StatelessWidget {
  String title;
  bool isMarket;
  CategoriesViewAll({Key? key, required this.title, required this.isMarket})
      : super(key: key);

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, child) {
        return Scaffold(
          backgroundColor: R.colors.bgColor,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: R.colors.blackColor,
            ),
            elevation: 0.0,
            backgroundColor: R.colors.bgColor,
            centerTitle: true,
            title: Text(
              title,
              style: R.textStyle
                  .mediumLato()
                  .copyWith(fontSize: FetchPixels.getPixelHeight(17)),
            ),
          ),
          body: Container(
              height: FetchPixels.height,
              width: FetchPixels.width,
              child: isMarket == true
                  ? StreamBuilder(
                      stream: firebaseFirestore.collection('News').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<NewsModel> news = snapshot.data!.docs
                              .map((e) => NewsModel.fromJson(
                                  e.data() as Map<String, dynamic>))
                              .toList();
                          List<NewsModel> userNews = [];
                          if (auth.userM.topics != null) {
                            userNews = news
                                .where((newsItem) => auth.userM.topics!.any(
                                    (topic) =>
                                        newsItem.assetName == topic.name &&
                                        (topic.newsType == 0 ||
                                            topic.newsType == 1)))
                                .toList();
                          }
                          return ListView.builder(
                              itemCount: firebaseAuth.currentUser == null ||
                                      auth.userM.topics!.isEmpty
                                  ? news.length
                                  : userNews.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(CoinCategoryView(
                                      coinName:
                                          firebaseAuth.currentUser == null ||
                                                  auth.userM.topics!.isEmpty
                                              ? news[index].assetName!
                                              : userNews[index].assetName!,
                                    ));
                                    // Get.to(NewsDetailPage(news: newsModel,index: index,));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(
                                        FetchPixels.getPixelHeight(10)),
                                    margin: EdgeInsets.all(
                                        FetchPixels.getPixelWidth(5)),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          FetchPixels.getPixelHeight(8)),
                                      border: Border.all(
                                          color: R.colors.borderColor,
                                          width: 0.4),
                                      color: R.colors.whiteColor,
                                    ),
                                    child: Row(children: [
                                      Container(
                                        width: FetchPixels.width / 2.6,
                                        decoration: BoxDecoration(
                                          color: Color(0xfff8f8fc),
                                        ),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height:
                                                    FetchPixels.getPixelHeight(
                                                        100),
                                                width: FetchPixels.width,
                                                decoration: BoxDecoration(
                                                    image:
                                                        getDecorationNetworkImage(
                                                      context,
                                                      firebaseAuth.currentUser ==
                                                                  null ||
                                                              auth.userM.topics!
                                                                  .isEmpty
                                                          ? news[index]
                                                              .coinImage!
                                                          : userNews[index]
                                                              .coinImage!,
                                                      fit: BoxFit.fill,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8))),
                                              ),
                                              getPaddingWidget(
                                                EdgeInsets.all(
                                                    FetchPixels.getPixelWidth(
                                                        5)),
                                                Text(
                                                  firebaseAuth.currentUser ==
                                                              null ||
                                                          auth.userM.topics!
                                                              .isEmpty
                                                      ? news[index].coinHeading!
                                                      : userNews[index]
                                                          .coinHeading!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: R.textStyle
                                                      .mediumLato()
                                                      .copyWith(
                                                          fontSize: FetchPixels
                                                              .getPixelHeight(
                                                                  14),
                                                          color: R
                                                              .colors.headings),
                                                ),
                                              ),
                                              getVerSpace(
                                                  FetchPixels.getPixelHeight(
                                                      1)),
                                            ]),
                                      ),
                                      Expanded(
                                          child: getAssetImage(R.images.graph,
                                              boxFit: BoxFit.fill)),
                                    ]),
                                  ),
                                );
                              });
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              color: R.colors.theme,
                            ),
                          );
                        }
                      })
                  : StreamBuilder(
                      stream: firebaseFirestore.collection('News').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<NewsModel> news = snapshot.data!.docs.map((e) => NewsModel.fromJson(e.data() as Map<String,dynamic>)).toList();
                          List<NewsModel> userNews = [];
                          if(auth.userM.topics != null){
                            userNews = news.where((newsItem) =>
                                auth.userM.topics!.any((topic) => newsItem.assetName == topic.name && (topic.newsType == 0 || topic.newsType == 1))
                            ).toList();
                          }
                          return GridView.builder(
                            itemCount: firebaseAuth.currentUser == null || auth.userM.topics!.isEmpty ? news.length : userNews.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            itemBuilder: (context,index){
                              return InkWell(
                                onTap: (){
                                  Get.to(TopicsView(coinsName: firebaseAuth.currentUser == null || auth.userM.topics!.isEmpty ? news[index].assetName! : userNews[index].assetName!));
                                },
                                child: getPaddingWidget(
                                  EdgeInsets.only(right: FetchPixels.getPixelWidth(8)),
                                  Column(
                                    children: [
                                      Container(
                                        height: FetchPixels.getPixelHeight(85),
                                        width: FetchPixels.getPixelWidth(75),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(FetchPixels.getPixelHeight(10)),
                                            image: getDecorationNetworkImage(context, firebaseAuth.currentUser == null || auth.userM.topics!.isEmpty ? news[index].coinImage! : userNews[index].coinImage!,
                                                fit: BoxFit.cover)),
                                      ),
                                      getVerSpace(FetchPixels.getPixelHeight(5)),
                                      Text(
                                        firebaseAuth.currentUser == null || auth.userM.topics!.isEmpty ? news[index].assetName! : userNews[index].assetName!,
                                        style: R.textStyle.regularLato().copyWith(
                                            fontSize: FetchPixels.getPixelHeight(14),
                                            color: R.colors.unSelectedIcon),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              color: R.colors.theme,
                            ),
                          );
                        }
                      })),
          // body: getPaddingWidget(
          //   EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
          //   Wrap(
          //     runSpacing: FetchPixels.getPixelHeight(10),
          //     spacing: FetchPixels.getPixelWidth(10),
          //     children: List.generate(auth.categoriesList.length, (index) {
          //       CategoryModel model = auth.categoriesList[index];
          //       return CategoriesWidget(
          //         index: index,
          //         model: model,
          //       );
          //     }),
          //   ),
          // ),
        );
      },
    );
  }
}
