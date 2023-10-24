import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../model/news_model.dart';

class NewsProvider extends ChangeNotifier {
  List<NewsModel> newsList = [];
  List<String> refId = [];
  bool isLoading = true;

  static Future<String> getImageUrl(String imagePath) async {
    if (imagePath.isNotEmpty) {
      Reference ref = FirebaseStorage.instance.ref().child(imagePath);
      String imageUrl = await ref.getDownloadURL();
      return imageUrl;
    }
    return ""; // Return a default value if imagePath is empty
  }

  Future<void> listenToNews() async {
    isLoading = true;
    final DateTime twoDaysAgo = DateTime.now().subtract(Duration(days: 2));

    FirebaseFirestore.instance
        .collection("News")
        .where('createdAt', isGreaterThanOrEqualTo: twoDaysAgo)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((querySnapshot) async {
      newsList.clear();
      refId.clear();

      for (final element in querySnapshot.docs) {
        final newsData = element.data();
        final imageUrl = await getImageUrl(newsData['coinImage']);

        newsData['coinImage'] = imageUrl;
        refId.add(element.reference.id);
        final newsModel = NewsModel.fromMap(newsData);

        newsList.add(newsModel);
      }
      isLoading = false;
      notifyListeners();
    });
  }
}
