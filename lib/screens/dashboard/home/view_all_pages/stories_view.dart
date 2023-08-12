import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../base/resizer/fetch_pixels.dart';
import '../../../../base/widget_utils.dart';
import '../../../../resources/resources.dart';
import '../../news_feed/model/news_model.dart';
import '../widgets/stories_widget.dart';

class StoriesView extends StatefulWidget {
  String coinsName;
  StoriesView({super.key,required this.coinsName});

  @override
  State<StoriesView> createState() => _StoriesViewState();
}

class _StoriesViewState extends State<StoriesView> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  List<NewsModel> searchList = [];

  String query = '';

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Scaffold(
      appBar: AppBar(
      elevation: 0.00,
      backgroundColor: R.colors.bgColor,
      automaticallyImplyLeading: false,
      title: Text(
        widget.coinsName,
        style: R.textStyle.mediumLato().copyWith(
            fontSize: FetchPixels.getPixelHeight(17),
            color: R.colors.blackColor),
      ),),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
        children: [
          getVerSpace(FetchPixels.getPixelHeight(10)),
          TextFormField(
            decoration:
            R.decorations.textFormFieldDecoration(null, "Search...").copyWith(
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
              builder: (context,snapshot){
                if(snapshot.hasData){
                  List<NewsModel> news = snapshot.data!.docs.map((e) => NewsModel.fromJson(e.data() as Map<String,dynamic>)).toList();
                  List<NewsModel> allNews = news.where((element) => element.coinName == widget.coinsName).toList();
                  searchList = allNews.where((element) {
                    String name = element.coinName!.toLowerCase();
                    return name.contains(query);
                  }).toList();
                  return  Center(
                    child: Wrap(spacing: FetchPixels.getPixelWidth(10),
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: List.generate(searchList.length, (index) {
                          return StoriesWidget(index: index,isAllView: true,news: searchList[index],);
                        })),
                  );
                }else{
                  return Center(child: SingleChildScrollView(),);
                }
              }),
        ],
      ),
    );
  }
}
