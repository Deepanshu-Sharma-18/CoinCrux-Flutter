import 'package:coincrux/base/resizer/fetch_pixels.dart';
import 'package:coincrux/base/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:photo_view/photo_view.dart';

import '../../../../resources/resources.dart';

class FullScreenImage extends StatefulWidget {
  const FullScreenImage({super.key, required this.imageurl});

  final String imageurl;

  @override
  State<FullScreenImage> createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          getVerSpace(FetchPixels.getPixelHeight(40)),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: R.colors.blackColor,
                    size: FetchPixels.getPixelHeight(20),
                  ),
                ),
                Text(
                  "Image",
                  style: R.textStyle
                      .mediumLato()
                      .copyWith(fontSize: FetchPixels.getPixelHeight(17)),
                ),
                SizedBox(
                  width: FetchPixels.getPixelWidth(30),
                ),
              ],
            ),
          ),
          getVerSpace(FetchPixels.getPixelHeight(200)),
          Container(
            width: FetchPixels.width,
            height: FetchPixels.getPixelHeight(400),
            decoration: BoxDecoration(
              color: R.colors.bgColor,
            ),
            child: PhotoView(
              backgroundDecoration: BoxDecoration(
                color: R.colors.bgColor,
              ),
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 2,
              imageProvider: NetworkImage(widget.imageurl),
            ),
          ),
        ],
      ),
    );
  }
}
