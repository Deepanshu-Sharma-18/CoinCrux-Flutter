import 'package:cloud_firestore/cloud_firestore.dart';
class NewsModel {
  String? coinImage;
  String? coinDescription;
  String? coinType;
  String? coinHeading;
  String? coinName;
  String? newsId;
  String? coinCategory;
  List<dynamic>? totalLikes = [];
  List<dynamic>? totalDislikes = [];
  DateTime? createdAt;
  String? createdBy;
  String? topicTitle;
  bool? marketsCard;

  NewsModel(
      {this.coinImage,
      this.coinDescription,
      this.coinType,
      this.coinHeading,
      this.coinName,
      this.newsId,
      this.totalLikes,
      this.totalDislikes,
      this.createdAt,
      this.coinCategory,
      this.createdBy,
      this.topicTitle,
      this.marketsCard});

  NewsModel.fromJson(Map<String, dynamic> json) {
    coinImage = json['coinImage'];
    coinDescription = json['coinDescription'];
    coinType = json['coinType'];
    coinHeading = json['coinHeading'];
    coinName = json['coinName'];
    newsId = json['newsId'];
    totalLikes = json['totalLikes'];
    totalDislikes = json['totalDislikes'];
    createdAt = json['createdAt'].toDate();
    coinCategory = json['category'];
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      coinImage: map['coinImage'] ?? 'https://cryptologos.cc/logos/bitcoin-btc-logo.png',
      coinDescription: map['coinDescription'] ?? '',
      coinType: map['coinType'] ?? '',
      coinHeading: map['coinHeading'] ?? '',
      coinName: map['coinName'] ?? '',
      newsId: map['newsId'] ?? '',
      totalLikes: map['totalLikes'] ?? 0,
      totalDislikes: map['totalDislikes'] ?? 0,
      createdAt: map['createdAt'] != null ? (map['createdAt'] as Timestamp).toDate() : null,
      coinCategory: map['coinCategory'] ?? '',
      createdBy: map['createdBy'] ?? '',
      topicTitle: map['topicTitle'] ?? '',
      marketsCard: map['marketCards'] ?? false,
    );
  }
}
