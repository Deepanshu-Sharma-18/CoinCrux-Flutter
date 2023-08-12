import 'package:coincrux/base/widget_utils.dart';
import 'package:coincrux/screens/dashboard/home/notifications/widgets/add_new_widget.dart';
import 'package:flutter/material.dart';

import '../../../../base/resizer/fetch_pixels.dart';
import '../../../../resources/resources.dart';

class AddNewAlert extends StatelessWidget {
  const AddNewAlert({super.key});

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
          "Add new Alert",
          style: R.textStyle
              .mediumLato()
              .copyWith(fontSize: FetchPixels.getPixelHeight(17)),
        ),
      ),
      body: getPaddingWidget(
        EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
        Column(children: [
          TextFormField(
            decoration: R.decorations
                .textFormFieldDecoration(null, "Search...")
                .copyWith(
                    prefixIcon: Icon(
                  Icons.search,
                  color: R.colors.fill,
                  size: FetchPixels.getPixelWidth(22),
                )),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return AddNewWidget();
              },
            ),
          )
        ]),
      ),
    );
  }
}
