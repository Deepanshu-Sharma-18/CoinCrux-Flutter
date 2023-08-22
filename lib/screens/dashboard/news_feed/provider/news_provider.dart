import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../model/news_model.dart';

class NewsProvider extends ChangeNotifier {
  List<NewsModel> newsList = [];
  bool isLoading = true;

  Future<String> getImageUrl(String imagePath) async {
    if (imagePath.isNotEmpty) {
      Reference ref = FirebaseStorage.instance.ref().child(imagePath);
      String imageUrl = await ref.getDownloadURL();
      return imageUrl;
    }
    return ""; // Return a default value if imagePath is empty
  }

  Future<void> listenToNews() async{
    isLoading = true;
    FirebaseFirestore.instance
        .collection("News")
        .snapshots()
        .listen((querySnapshot) async {
      newsList.clear();

      for (final element in querySnapshot.docs) {
        final newsData = element.data();
        final imageUrl = await getImageUrl(newsData['coinImage']);

        newsData['coinImage'] = imageUrl;
        final newsModel = NewsModel.fromMap(newsData);

        newsList.add(newsModel);
      }
      newsList.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      isLoading = false;
      notifyListeners();
    });
  }
}
