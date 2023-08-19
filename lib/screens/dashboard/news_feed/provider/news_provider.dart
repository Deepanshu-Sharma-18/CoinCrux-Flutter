import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/news_model.dart';

class NewsProvider extends ChangeNotifier {
  List<NewsModel> newsList = [];
  NewsProvider() {
    _listenToNews();
  }
  void _listenToNews() {
    FirebaseFirestore.instance
        .collection("News")
        .snapshots()
        .listen((querySnapshot) {
      newsList.clear();

      querySnapshot.docs.forEach((element) {
        final newsData = element.data();
        final newsModel = NewsModel.fromMap(newsData);
        newsList.add(newsModel);
      });
      newsList.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      notifyListeners();
    });
  }
}
