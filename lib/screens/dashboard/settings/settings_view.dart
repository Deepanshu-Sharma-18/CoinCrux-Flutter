import 'dart:io';

import 'package:coincrux/base/resizer/fetch_pixels.dart';
import 'package:coincrux/screens/dashboard/news_feed/news_feed_view.dart';
import 'package:coincrux/screens/dashboard/settings/pages/about_us.dart';
import 'package:coincrux/screens/dashboard/settings/pages/book_marks_view.dart';
import 'package:coincrux/screens/dashboard/settings/pages/feedback_view.dart';
import 'package:coincrux/screens/dashboard/settings/pages/privacy_policy.dart';
import 'package:coincrux/screens/dashboard/settings/pages/terms_condition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/widget_utils.dart';
import '../../../resources/resources.dart';
import '../../../routes/app_routes.dart';

class SettingsView extends StatefulWidget {
  SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool isNotifications = false;
  bool isDark = false;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  List<String> pagesNames = [
    "Terms & Conditions",
    "Privacy Policy",
    "About Us",
    "Share App",
    "Rate App",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.bgColor,
      // appBar: AppBar(
      //   iconTheme: IconThemeData(
      //     color: R.colors.blackColor, //change your color here
      //   ),
      //   elevation: 0.0,
      //   backgroundColor: R.colors.bgColor,
      //   centerTitle: true,
      //   title: Text(
      //     "Settings",
      //     style: R.textStyle
      //         .mediumLato()
      //         .copyWith(fontSize: FetchPixels.getPixelHeight(17)),
      //   ),
      // ),
      body: Container(
        child: Column(
          children: [
            firebaseAuth.currentUser != null ? SizedBox() : SizedBox(height: FetchPixels.getPixelHeight(20),),
           firebaseAuth.currentUser != null ? SizedBox() : Container(
              padding: EdgeInsets.fromLTRB(10, 15, 13, 15),
              height: FetchPixels.getPixelHeight(160),
              width: FetchPixels.width/1.13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: Offset(-2, 0), // left shadow
                    blurRadius: 3,
                  ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: Offset(2, 0), // right shadow
                    blurRadius: 3,
                  ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: Offset(0, -2), // top shadow
                    blurRadius: 3,
                  ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: Offset(0, 2), // bottom shadow
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Save Your Preferences",style: R.textStyle.mediumLato().copyWith(color: R.colors.blackColor,fontSize: FetchPixels.getPixelHeight(20)),),
                  Text("Sign in to save your Likes & Bookmarks.",style: R.textStyle.regularLato().copyWith(color: R.colors.blackColor,fontSize: FetchPixels.getPixelHeight(16)),),
                  SizedBox(height: FetchPixels.getPixelHeight(30),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Get.toNamed(Routes.loginView);
                        },
                        child: Container(
                          height: FetchPixels.getPixelHeight(44),
                          width: FetchPixels.getPixelWidth(130),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                FetchPixels.getPixelHeight(7),
                              ),
                              color: Colors.red),
                          child: Center(
                            child: Text(
                              "Sign In",
                              style: R.textStyle.mediumLato().copyWith(
                                  fontSize:
                                  FetchPixels.getPixelHeight(18),
                                  color: R.colors.whiteColor),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Spacer(),
                      InkWell(
                        onTap: (){
                          Get.offAllNamed(Routes.loginView);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: FetchPixels.getPixelWidth(10),
                              vertical: FetchPixels.getPixelHeight(5)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  FetchPixels.getPixelHeight(5)),
                              border: Border.all(color: R.colors.theme)),
                          child: getAssetImage(R.images.fbIcon,
                              scale: FetchPixels.getPixelHeight(20)),
                        ),
                      ),
                      SizedBox(width: FetchPixels.getPixelWidth(10),),
                      InkWell(
                        onTap: (){
                          Get.offAllNamed(Routes.loginView);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: FetchPixels.getPixelWidth(10),
                              vertical: FetchPixels.getPixelHeight(5)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  FetchPixels.getPixelHeight(5)),
                              border: Border.all(color: Colors.red)),
                          child: getAssetImage(R.images.googleIcon,
                              scale: FetchPixels.getPixelHeight(20)),
                        ),
                      ),
                      SizedBox(width: FetchPixels.getPixelWidth(10),),
                      Platform.isIOS ? InkWell(
                        onTap: (){
                          Get.offAllNamed(Routes.loginView);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: FetchPixels.getPixelWidth(10),
                              vertical: FetchPixels.getPixelHeight(5)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  FetchPixels.getPixelHeight(5)),
                              border: Border.all(color: Colors.black)),
                          child: getAssetImage(R.images.apple,
                              scale: FetchPixels.getPixelHeight(20)),
                        ),
                      ) : SizedBox()
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: FetchPixels.getPixelHeight(60),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notifications',
                  style: R.textStyle.regularLato().copyWith(
                    fontSize: FetchPixels.getPixelHeight(17),
                  ),
                ),
                SizedBox(
                  height: FetchPixels.getPixelHeight(20),
                  child: Switch(
                    activeColor: R.colors.theme,
                    value: isNotifications,
                    onChanged: (bool value) {
                      setState(() {
                        isNotifications = value;
                      });
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: FetchPixels.getPixelHeight(25),),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       'Theme',
            //       style: R.textStyle.regularLato().copyWith(
            //         fontSize: FetchPixels.getPixelHeight(17),
            //       ),
            //     ),
            //     SizedBox(
            //       height: FetchPixels.getPixelHeight(20),
            //       child: Switch(
            //         activeColor: R.colors.theme,
            //         value: isDark,
            //         onChanged: (bool value) {
            //           setState(() {
            //             isDark = value;
            //           });
            //         },
            //       ),
            //     )
            //   ],
            // ),
            SizedBox(height: FetchPixels.getPixelHeight(60),),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'About CoinCrux',
                style: R.textStyle.mediumLato().copyWith(
                  fontSize: FetchPixels.getPixelHeight(18),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                  vertical: FetchPixels.getPixelHeight(10),
                ),
                itemCount: pagesNames.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: pagesName(index),
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget pagesName(index) {
    return GestureDetector(
      onTap: () {
        index == 0
            ? Get.to(TermsConditions())
            : index == 1
                ? Get.to(PrivacyPolicy())
                : index == 2
                    ? Get.to(AboutUs())
                    : null;
      },
      child: Column(
        children: [
          Row(
            children: [
              index == 0
                  ? getAssetImage(R.images.terms,scale: 25)
                  : index == 1 ? getAssetImage(R.images.privacy,scale: 25)
                  :index == 2 ? getAssetImage(R.images.info,scale: 25)
                  : index == 3 ? getAssetImage(R.images.share,scale: 4)
              : getAssetImage(R.images.star,scale: 25),
              SizedBox(width: FetchPixels.getPixelWidth(10),),
              Text(
                pagesNames[index],
                style: R.textStyle.regularLato().copyWith(
                      fontSize: FetchPixels.getPixelHeight(18),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
