import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../base/resizer/fetch_pixels.dart';
import '../../base/widget_utils.dart';
import '../../resources/resources.dart';
import '../auth/provider/auth_provider.dart';
import 'home/home_view.dart';
import 'news_feed/news_feed_view.dart';
import 'settings/settings_view.dart';
import 'profile/profile_view.dart';

class DashBoardPage extends StatefulWidget {
  final int index;
  DashBoardPage({Key? key, this.index = 0}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  int currentPage = 0;
  late PageController pageController;

  @override
  void initState() {
    var c = Provider.of<AuthProvider>(context, listen: false);
    c.isFeedView = false;
    currentPage = widget.index;
    pageController = PageController(initialPage: widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, child) {
        return Scaffold(
          backgroundColor: R.colors.bgColor,
          appBar: auth.isFeedView == true
              ? null
              : AppBar(
                  elevation: 0.00,
                  backgroundColor: R.colors.bgColor,
                  automaticallyImplyLeading: false,
                  title: Row(
                    children: [
                      Text(
                        auth.dashCurrentPage == 0
                            ? "Home"
                            : auth.dashCurrentPage == 1
                                ? "Feed"
                                : auth.dashCurrentPage == 2
                                    ? "Settings"
                                    : "Profile",
                        style: R.textStyle.mediumLato().copyWith(
                              fontSize: FetchPixels.getPixelHeight(23),
                              color: R.colors.blackColor,
                            ),
                      ),
                      Spacer(),
                      // ... your other AppBar content ...
                    ],
                  ),
                ),
          body: SafeArea(
            child: getPaddingWidget(
              EdgeInsets.symmetric(
                horizontal: FetchPixels.getPixelWidth(
                    auth.dashCurrentPage == 1 ? 0 : 20),
              ),
              PageView(
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (page) {
                  auth.dashCurrentPage = page;
                },
                children: [
                  HomeView(),
                  NewsFeedView(),
                  SettingsView(),
                  if (firebaseAuth.currentUser != null) ProfileView(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: auth.isFeedView == true
              ? null
              : CurvedNavigationBar(
                  backgroundColor: R.colors.theme,
                  items: [
                    Icon(
                      Icons.home,
                      color: R.colors.theme,
                      size: FetchPixels.getPixelHeight(25),
                    ),
                    Icon(
                      Icons.newspaper,
                      color: R.colors.theme,
                      size: FetchPixels.getPixelHeight(25),
                    ),
                    Icon(
                      Icons.settings,
                      color: R.colors.theme,
                      size: FetchPixels.getPixelHeight(25),
                    ),
                    if (firebaseAuth.currentUser != null)
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: FetchPixels.getPixelHeight(25),
                      ),
                  ],
                  onTap: (index) {
                    auth.dashCurrentPage = index;
                    pageController.jumpToPage(index);
                  },
                ),
        );
      },
    );
  }
}