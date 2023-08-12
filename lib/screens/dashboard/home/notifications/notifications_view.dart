import 'package:coincrux/screens/dashboard/home/notifications/price_alert.dart';
import 'package:flutter/material.dart';

import '../../../../base/resizer/fetch_pixels.dart';
import '../../../../base/widget_utils.dart';
import '../../../../resources/resources.dart';
import 'notifications.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  PageController pagePC = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: R.colors.bgColor,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: R.colors.blackColor, //change your color here
          ),
          elevation: 0.5,
          actions: [
            Icon(Icons.search,color: Colors.black,),
            SizedBox(width: FetchPixels.getPixelWidth(10),)
          ],
          backgroundColor: R.colors.bgColor,
          centerTitle: true,
          title: Text(
            "Notifications",
            style: R.textStyle
                .mediumLato()
                .copyWith(fontSize: FetchPixels.getPixelHeight(17)),
          ),
        ),
        body: Notifications()
    );
  }

  Widget heading(index) {
    return InkWell(
      onTap: () {
        currentPage = index;
        pagePC.animateToPage(currentPage,
            duration: Duration(microseconds: 500), curve: Curves.ease);
        setState(() {});
      },
      child: Column(
        children: [
          Text(
            index == 0 ? "Notifications" : "Price Alerts",
            style: R.textStyle.mediumLato().copyWith(
                fontSize: FetchPixels.getPixelHeight(16),
                color: currentPage == index ? R.colors.theme : R.colors.fill),
          ),
          getVerSpace(FetchPixels.getPixelHeight(5)),
          Container(
            color: currentPage == index ? R.colors.theme : R.colors.fill,
            height: FetchPixels.getPixelHeight(2),
            width: FetchPixels.getPixelWidth(150),
          )
        ],
      ),
    );
  }
}
