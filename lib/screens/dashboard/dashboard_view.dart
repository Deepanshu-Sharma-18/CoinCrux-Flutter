import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coincrux/screens/dashboard/news_feed/provider/news_provider.dart';
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
  int currentPage = 0;
  late PageController pageController;

  @override
  void initState() {
    Provider.of<NewsProvider>(context, listen: false).listenToNews();
    currentPage = widget.index;
    pageController = PageController(initialPage: widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.bgColor,
      
      body: SafeArea(
        child: getPaddingWidget(
          EdgeInsets.symmetric(
            horizontal:
                FetchPixels.getPixelWidth(0),
          ),
          PageView(
            controller: pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (page) {
              
            },
            children: [
              HomeView(),
              NewsFeedView(),
              SettingsView(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
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
        ],
        onTap: (index) {
          currentPage = index;
          pageController.jumpToPage(index);
        },
      ),
    );
  }
}
