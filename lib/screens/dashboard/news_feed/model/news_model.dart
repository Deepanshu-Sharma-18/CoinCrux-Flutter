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
  String? marketsCard;

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coinImage'] = this.coinImage;
    data['coinDescription'] = this.coinDescription;
    data['coinType'] = this.coinType;
    data['coinHeading'] = this.coinHeading;
    data['coinName'] = this.coinName;
    data['newsId'] = this.newsId;
    data['totalLikes'] = this.totalLikes;
    data['totalDislikes'] = this.totalDislikes;
    data['createdAt'] = this.createdAt;
    data['category'] = this.coinCategory;
    data['createdBy'] = this.createdBy;
    data['marketsCard'] = this.marketsCard;
    data['topicTitle'] = this.topicTitle;
    return data;
  }
}
