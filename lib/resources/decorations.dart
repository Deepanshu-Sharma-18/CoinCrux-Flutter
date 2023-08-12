import 'package:coincrux/resources/resources.dart';
import 'package:flutter/material.dart';

import '../base/resizer/fetch_pixels.dart';


class AppDecorations {
  // InputDecoration textFormFieldLogin(
  //   Widget? suffix,
  //   String hintText,
  // ) {
  //   return InputDecoration(
  //     suffixIcon: suffix,
  //     isDense: true,
  //     labelStyle: R.textStyle.regularPoppins(),
  //     floatingLabelBehavior: FloatingLabelBehavior.never,
  //     focusedBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.only(
  //           topRight: Radius.circular(20),
  //           topLeft: Radius.circular(FetchPixels.getPixelHeight(20))),
  //       borderSide: BorderSide(
  //         width: 0.5,
  //         color: R.colors.bgGradient1,
  //       ),
  //     ),
  //     disabledBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.only(
  //           topRight: Radius.circular(20),
  //           topLeft: Radius.circular(FetchPixels.getPixelHeight(20))),
  //       borderSide: BorderSide(width: 0.5, color: R.colors.whiteColor),
  //     ),
  //     enabledBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.only(
  //           topRight: Radius.circular(20),
  //           topLeft: Radius.circular(FetchPixels.getPixelHeight(20))),
  //       borderSide: BorderSide(width: 0.5, color: R.colors.whiteColor),
  //     ),
  //     border: OutlineInputBorder(
  //       borderSide: BorderSide(width: 0.5, color: R.colors.whiteColor),
  //       borderRadius: BorderRadius.only(
  //           topRight: Radius.circular(20),
  //           topLeft: Radius.circular(FetchPixels.getPixelHeight(20))),
  //     ),
  //     filled: true,
  //     fillColor: R.colors.blackColor,
  //     focusColor: R.colors.bgGradient1,
  //     hintText: hintText,
  //
  //     hintStyle: R.textStyle
  //         .mediumPoppins()
  //         .copyWith(fontSize: 13, color: R.colors.whiteColor),
  //
  //     //  border: OutlineInputBorder()
  //   );
  // }

  InputDecoration textFormFieldDecoration(
    Widget? suffix,
    String hintText,
  ) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(16),
      horizontal: FetchPixels.getPixelWidth(20)
      ),
      suffixIcon: suffix,
      isDense: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(5)),
        borderSide: BorderSide(
          width: 0.4,
          color: R.colors.theme,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(5)),
        borderSide: BorderSide(width: 0.4, color: Colors.grey.withOpacity(0.4),),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(5)),
        borderSide: BorderSide(width: 0.4, color: Colors.grey.withOpacity(0.4),),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 0.4,color: Colors.grey.withOpacity(0.4),),
        borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(5)),
      ),
      filled: true,
      fillColor: R.colors.transparent,
      focusColor: R.colors.fill,
      hintText: hintText,

      hintStyle: R.textStyle
          .regularLato().copyWith(fontSize: FetchPixels.getPixelHeight(15),color: R.colors.fill)

      //  border: OutlineInputBorder()
    );
  }
}
