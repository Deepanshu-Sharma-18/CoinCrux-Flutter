import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../base/resizer/fetch_pixels.dart';
import '../../../../base/widget_utils.dart';
import '../../../../resources/resources.dart';
import '../../news_feed/model/news_model.dart';
import '../widgets/stories_widget.dart';

class AllStoriesView extends StatefulWidget {
  AllStoriesView({super.key});

  @override
  State<AllStoriesView> createState() => _AllStoriesViewState();
}

class _AllStoriesViewState extends State<AllStoriesView> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  List<NewsModel> searchNews = [];

  String query = '';

  @override
  Widget build(BuildContext context) {
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
          "Stories",
          style: R.textStyle
              .mediumLato()
              .copyWith(fontSize: FetchPixels.getPixelHeight(17)),
        ),
      ),
      body: ListView(
        padding:
            EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
        children: [
          getVerSpace(FetchPixels.getPixelHeight(10)),
          TextFormField(
            decoration: R.decorations
                .textFormFieldDecoration(null, "Search...")
                .copyWith(
                    prefixIcon: Icon(
                  Icons.search,
                  color: R.colors.fill,
                  size: FetchPixels.getPixelWidth(22),
                )),
            onChanged: (v){
              setState(() {
                query = v;
              });
            },
          ),
          getVerSpace(FetchPixels.getPixelHeight(10)),
          StreamBuilder(
              stream: firebaseFirestore.collection('News').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<NewsModel> news = snapshot.data!.docs
                      .map((e) =>
                          NewsModel.fromJson(e.data() as Map<String, dynamic>))
                      .toList();
                  searchNews = news.where((element) {
                    String name = element.coinName!.toLowerCase();
                    return name.contains(query);
                  }).toList();
                  return Center(
                    child: Wrap(spacing: FetchPixels.getPixelWidth(10),
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: List.generate(searchNews.length, (index) {
                          return StoriesWidget(index: index,isAllView: true,news: searchNews[index],);
                        })),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ],
      ),
    );
  }
}
