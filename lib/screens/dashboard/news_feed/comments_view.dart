import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coincrux/base/widget_utils.dart';
import 'package:coincrux/screens/dashboard/news_feed/model/comments.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../base/resizer/fetch_pixels.dart';
import '../../../resources/resources.dart';
import 'model/news_model.dart';

class CommentsView extends StatelessWidget {
  NewsModel news;
   CommentsView({Key? key,required this.news}) : super(key: key);

   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
   FirebaseAuth firebaseAuth = FirebaseAuth.instance;

TextEditingController commentTC =TextEditingController();
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
          "Comments",
          style: R.textStyle
              .mediumLato()
              .copyWith(fontSize: FetchPixels.getPixelHeight(17)),
        ),
      ),
      body: ListView(
          padding:
              EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
          children: [
            Container(
              padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
              // height: FetchPixels.getPixelHeight(170),
              width: FetchPixels.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    FetchPixels.getPixelHeight(5),
                  ),
                  color: R.colors.whiteColor),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "HashKey Rolls Out Wealth Management Service for Digital Assets in Asia",
                      style: R.textStyle
                          .mediumLato()
                          .copyWith(fontSize: FetchPixels.getPixelHeight(20)),
                    ),
                    getVerSpace(FetchPixels.getPixelHeight(10)),
                    Text(
                      "Hong Kong-based HashKey has launched a wealth management service that will allow institutional clients in Asia",
                      style: R.textStyle
                          .regularLato()
                          .copyWith(fontSize: FetchPixels.getPixelHeight(16)),
                    ),

                  ]),
            ),
            getVerSpace(FetchPixels.getPixelHeight(10)),
            StreamBuilder(
                stream: firebaseFirestore.collection("comments").where("newsId",isEqualTo: news.newsId).snapshots(),
                builder: (context,snapshot){
              if(snapshot.hasData){
                List<CommentModel> commentsList = snapshot.data!.docs.map((e) => CommentModel.fromJson(e.data() as Map<String,dynamic>)).toList();
                return Column(children: List.generate(commentsList.length, (index) {
                  return comments(commentsList[index]);
                }),);
              }else{
                return Center(child: CircularProgressIndicator(color: R.colors.theme,),);
              }
            }),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    cursorColor: R.colors.blackColor,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: R.textStyle
                        .mediumLato()
                        .copyWith(color: R.colors.blackColor, fontSize: 14),

                    controller: commentTC,
                    decoration: R.decorations.textFormFieldDecoration(null, "add comment"),
                  ),
                ),
                getHorSpace(FetchPixels.getPixelWidth(10)),
                InkWell(
                    onTap: ()async{
                      if(firebaseAuth.currentUser == null){
                        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please login")));
                      }else{
                        if(commentTC.text == ''){
                        }else{
                          DocumentSnapshot document = await firebaseFirestore.collection('users').doc(firebaseAuth.currentUser!.uid).get();
                          CommentModel commentModel = CommentModel(userId: firebaseAuth.currentUser!.uid,comment: commentTC.text,newsId: news.newsId,userName: document.get('name'),commentLikes: [],commentDisLikes: []);
                          firebaseFirestore.collection("comments").add(commentModel.toJson()).then((value) {
                            firebaseFirestore.collection("comments").doc(value.id).update({"commentId": value.id});
                          });
                        }
                        commentTC.text = '';
                      }
                    },
                    child: Icon(Icons.send,color: R.colors.theme,size: FetchPixels.getPixelHeight(35),))
              ],
            ),
            getVerSpace(FetchPixels.getPixelHeight(20)),
          ]),
    );
  }

  Widget comments(CommentModel comments) {
    return getPaddingWidget(
      EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(10)),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            comments.userName ?? '',
            style: R.textStyle
                .mediumLato()
                .copyWith(fontSize: FetchPixels.getPixelHeight(16)),
          ),
          getVerSpace(FetchPixels.getPixelHeight(5)),
          Text(
            comments.comment!,
            style: R.textStyle
                .regularLato()
                .copyWith(fontSize: FetchPixels.getPixelHeight(16)),
          ),
          getVerSpace(FetchPixels.getPixelHeight(10)),
          Row(
            children: [
              InkWell(
                onTap: ()async{
                  DocumentSnapshot docs = await firebaseFirestore.collection("comments").doc(comments.commentId).get();
                  List<dynamic> likesList = docs.get('commentLikes');
                  if(likesList.contains(firebaseAuth.currentUser!.uid)){
                    likesList.remove(firebaseAuth.currentUser!.uid);
                    firebaseFirestore.collection("comments").doc(comments.commentId).update({"commentLikes": likesList});
                    comments.commentLikes!.length = likesList.length;
                  }else{
                    likesList.add(firebaseAuth.currentUser!.uid);
                    firebaseFirestore.collection("comments").doc(comments.commentId).update({"commentLikes": likesList});
                    comments.commentLikes!.length = likesList.length;
                  }
                },
                child: Icon(
                  Icons.thumb_up_off_alt_outlined,
                  color: R.colors.unSelectedIcon,
                  size: FetchPixels.getPixelHeight(28),
                ),
              ),
              getHorSpace(FetchPixels.getPixelWidth(5)),
              Text(
                '${comments.commentLikes!.length}',
                style: R.textStyle.regularLato().copyWith(
                    fontSize: FetchPixels.getPixelHeight(16),
                    color: R.colors.unSelectedIcon),
              ),
              getHorSpace(FetchPixels.getPixelWidth(20)),
              InkWell(
                onTap: ()async{
                  DocumentSnapshot docs = await firebaseFirestore.collection("comments").doc(comments.commentId).get();
                  List<dynamic> likesList = docs.get('commentDisLikes');
                  if(likesList.contains(firebaseAuth.currentUser!.uid)){
                    likesList.remove(firebaseAuth.currentUser!.uid);
                    firebaseFirestore.collection("comments").doc(comments.commentId).update({"commentDisLikes": likesList});
                    comments.commentDisLikes!.length = likesList.length;
                  }else{
                    likesList.add(firebaseAuth.currentUser!.uid);
                    firebaseFirestore.collection("comments").doc(comments.commentId).update({"commentDisLikes": likesList});
                    comments.commentDisLikes!.length = likesList.length;
                  }
                },
                child: Icon(
                  Icons.thumb_down_off_alt_outlined,
                  color: R.colors.unSelectedIcon,
                  size: FetchPixels.getPixelHeight(28),
                ),
              ),
              getHorSpace(FetchPixels.getPixelWidth(5)),
              Text(
                "${comments.commentDisLikes!.length}",
                style: R.textStyle.regularLato().copyWith(
                    fontSize: FetchPixels.getPixelHeight(16),
                    color: R.colors.unSelectedIcon),
              ),
              getHorSpace(FetchPixels.getPixelWidth(20)),
            ],
          )
        ],
      ),
    );
  }
}
