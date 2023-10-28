class CommentModel {
  String? userId;
  String? newsId;
  String? comment;
  String? userName;
  String? commentId;
  List<dynamic>? commentLikes = [];
  List<dynamic>? commentDisLikes = [];
  List<dynamic>? replies = [];

  CommentModel(
      {this.userId,
      this.newsId,
      this.comment,
      this.userName,
      this.commentLikes,
      this.commentDisLikes,
      this.commentId,
      this.replies});

  CommentModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    newsId = json['newsId'];
    comment = json['comment'];
    userName = json['userName'];
    commentLikes = json['commentLikes'];
    commentDisLikes = json['commentDisLikes'];
    commentId = json['commentId'];
    replies = json['replies'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['newsId'] = this.newsId;
    data['comment'] = this.comment;
    data['userName'] = this.userName;
    data['commentLikes'] = this.commentLikes;
    data['commentDisLikes'] = this.commentDisLikes;
    data['commentId'] = this.commentId;
    data['replies'] = this.replies;
    return data;
  }
}
