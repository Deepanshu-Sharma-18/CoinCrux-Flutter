import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:coincrux/base/resizer/fetch_pixels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resources/resources.dart';
import 'constant.dart';

Widget getVerSpace(double verSpace) {
  return SizedBox(
    height: verSpace,
  );
}

Widget getAssetImage(String image,
    {double? width,
    double? height,
    Color? color,
    double? scale,
    BoxFit boxFit = BoxFit.contain}) {
  return Image.asset(
    "${Constant.assetImagePath}$image",
    color: color,
    width: width,
    height: height,
    fit: boxFit,
    scale: scale,
  );
}

Widget getNetworkImage(String image,
    {double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.contain}) {
  return CircleAvatar(
    radius: 10,
    backgroundColor: Colors.transparent,
    backgroundImage: CachedNetworkImageProvider(
      image,
    ),
  );
}

Widget getNetworkImageFeed(String image,
    {double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.contain}) {
  return Container(
      height: height,
      width: width,
      child: Image(
        image: NetworkImage(image),
        fit: boxFit,
      ));
}

Widget getFileImage(File image,
    {double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.fill}) {
  return CircleAvatar(
      radius: 45,
      backgroundColor: Colors.transparent,
      child: ClipOval(
        child: Image.file(
          image,
          color: color,
          width: width,
          height: height,
          fit: boxFit,
          scale: FetchPixels.getScale(),
        ),
      ));
}

Widget getFileImageContainer(File image,
    {double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.fill}) {
  return Image.file(
    image,
    color: color,
    width: width,
    height: height,
    fit: boxFit,
    scale: FetchPixels.getScale(),
  );
}

// Widget getSvgImage(String image,
//     {double? width,
//     double? height,
//     Color? color,
//     BoxFit boxFit = BoxFit.contain}) {
//   return SvgPicture.asset(
//     Constant.assetImagePath + image,
//     color: color,
//     width: width,
//     height: height,
//     fit: boxFit,
//   );
// }

Widget getPaddingWidget(EdgeInsets edgeInsets, Widget widget) {
  return Padding(
    padding: edgeInsets,
    child: widget,
  );
}

DecorationImage getDecorationAssetImage(BuildContext buildContext, String image,
    {BoxFit fit = BoxFit.contain}) {
  return DecorationImage(
      image: AssetImage((Constant.assetImagePath) + image),
      fit: fit,
      scale: FetchPixels.getScale());
}

DecorationImage getDecorationNetworkImage(
    BuildContext buildContext, String image,
    {BoxFit fit = BoxFit.contain}) {
  return DecorationImage(
      image: NetworkImage(image), fit: fit, scale: FetchPixels.getScale());
}

Widget getMultilineCustomFont(String text, double fontSize, Color fontColor,
    {String fontFamily = Constant.fontsFamily,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    txtHeight = 1.0}) {
  return Text(
    text,
    style: TextStyle(
        decoration: decoration,
        fontSize: fontSize,
        fontStyle: FontStyle.normal,
        color: fontColor,
        fontFamily: fontFamily,
        height: txtHeight,
        fontWeight: fontWeight),
    textAlign: textAlign,
    textScaleFactor: FetchPixels.getTextScale(),
  );
}

BoxDecoration getButtonDecoration(
    {BorderRadius? borderRadius,
    LinearGradient? gradient,
    Border? border,
    List<BoxShadow> shadow = const [],
    DecorationImage? image}) {
  return BoxDecoration(
      gradient: gradient,
      borderRadius: borderRadius,
      border: border,
      boxShadow: shadow,
      image: image);
}

Widget getDefaultTextFiledWithLabel(
    BuildContext context, String s, TextEditingController textEditingController,
    {bool withprefix = false,
    bool withSufix = false,
    bool maxLines = false,
    int? maxLineNumber,
    bool minLines = false,
    FormFieldValidator? validator,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
    bool isPass = false,
    bool isEnable = true,
    bool isReadOnly = false,
    Color? fillColor,
    double? height,
    double? imageHeight,
    double? imageWidth,
    String? image,
    TextInputAction? textInputAction,
    TextInputType? keyBoardType,
    Function(String)? onChange,
    String? suffiximage,
    Function? imagefunction,
    AlignmentGeometry alignmentGeometry = Alignment.centerLeft,
    List<TextInputFormatter>? inputFormatters,
    bool defFocus = false,
    FocusNode? focus1}) {
  FocusNode myFocusNode = (focus1 == null) ? FocusNode() : focus1;
  // Color color = borderColor;

  return StatefulBuilder(
    builder: (context, setState) {
      final mqData = MediaQuery.of(context);
      final mqDataNew =
          mqData.copyWith(textScaleFactor: FetchPixels.getTextScale());

      return Focus(
        onFocusChange: (hasFocus) {
          if (hasFocus) {
            setState(() {
              myFocusNode.canRequestFocus = true;
              // color = buttonColor;
            });
          } else {
            setState(() {
              myFocusNode.canRequestFocus = false;
              // color = borderColor;
            });
          }
        },
        focusNode: myFocusNode,
        child: MediaQuery(
          data: mqDataNew,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  cursorColor: R.colors.whiteColor,
                  readOnly: isReadOnly,
                  textInputAction: textInputAction,
                  keyboardType: keyBoardType,
                  onChanged: onChange,
                  validator: validator,
                  enabled: isEnable ? true : false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: inputFormatters,
                  maxLines: (minLines)
                      ? null
                      : maxLines
                          ? maxLineNumber!
                          : 1,
                  controller: textEditingController,
                  obscuringCharacter: "*",
                  autofocus: false,
                  obscureText: isPass,
                  style: TextStyle(
                      color: R.colors.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: Constant.fontsFamily),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: fillColor,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(FetchPixels.getPixelHeight(30))),
                        borderSide: BorderSide(
                          width: 1,
                          color: R.colors.whiteColor,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(FetchPixels.getPixelHeight(30))),
                        borderSide:
                            BorderSide(width: 1, color: R.colors.whiteColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(FetchPixels.getPixelHeight(30))),
                        borderSide:
                            BorderSide(width: 1, color: R.colors.whiteColor),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: R.colors.whiteColor),
                        borderRadius: BorderRadius.all(
                            Radius.circular(FetchPixels.getPixelHeight(30))),
                      ),
                      isDense: true,
                      // border: InputBorder.none,
                      hintText: s,
                      hintStyle: TextStyle(
                          color: R.colors.whiteColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          fontFamily: Constant.fontsFamily)),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget getDefaultTextFiledWithSuffixPrefix(
    BuildContext context, String s, TextEditingController textEditingController,
    {bool withprefix = false,
    bool withSufix = false,
    bool maxLines = false,
    int? maxLineNumber,
    bool minLines = false,
    FormFieldValidator? validator,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
    bool isPass = false,
    bool isEnable = true,
    bool isReadOnly = false,
    Color? fillColor,
    double? height,
    double? imageHeight,
    double? imageWidth,
    String? image,
    TextInputType? keyBoardType,
    Function(String)? onChange,
    String? suffiximage,
    Function? imagefunction,
    AlignmentGeometry alignmentGeometry = Alignment.centerLeft,
    List<TextInputFormatter>? inputFormatters,
    bool defFocus = false,
    FocusNode? focus1}) {
  FocusNode myFocusNode = (focus1 == null) ? FocusNode() : focus1;
  // Color color = borderColor;

  return StatefulBuilder(
    builder: (context, setState) {
      final mqData = MediaQuery.of(context);
      final mqDataNew =
          mqData.copyWith(textScaleFactor: FetchPixels.getTextScale());

      return Focus(
        onFocusChange: (hasFocus) {
          if (hasFocus) {
            setState(() {
              myFocusNode.canRequestFocus = true;
              // color = buttonColor;
            });
          } else {
            setState(() {
              myFocusNode.canRequestFocus = false;
              // color = borderColor;
            });
          }
        },
        focusNode: myFocusNode,
        child: MediaQuery(
          data: mqDataNew,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  cursorColor: R.colors.whiteColor,
                  readOnly: isReadOnly,
                  keyboardType: keyBoardType,
                  onChanged: onChange,
                  validator: validator,
                  enabled: isEnable ? true : false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: inputFormatters,
                  maxLines: (minLines)
                      ? null
                      : maxLines
                          ? maxLineNumber!
                          : 1,
                  controller: textEditingController,
                  obscuringCharacter: "*",
                  autofocus: false,
                  obscureText: isPass,
                  style: TextStyle(
                      color: R.colors.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: Constant.fontsFamily),
                  decoration: InputDecoration(
                      suffixIcon: (!withSufix)
                          ? SizedBox()
                          : Padding(
                              padding: EdgeInsets.only(
                                  right: FetchPixels.getPixelHeight(14),
                                  left: FetchPixels.getPixelHeight(12)),
                              child: InkWell(
                                onTap: () {
                                  if (imagefunction != null) {
                                    imagefunction();
                                  }
                                },
                                child: getAssetImage(suffiximage!,
                                    height: FetchPixels.getPixelHeight(24),
                                    width: FetchPixels.getPixelHeight(24)),
                              ),
                            ),
                      prefixIcon: (!withprefix)
                          ? SizedBox()
                          : Padding(
                              padding: EdgeInsets.only(
                                  right: FetchPixels.getPixelHeight(8),
                                  left: FetchPixels.getPixelHeight(18)),
                              child: getAssetImage(image!,
                                  height: FetchPixels.getPixelHeight(24),
                                  width: FetchPixels.getPixelHeight(24)),
                            ),
                      filled: true,
                      fillColor: fillColor,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(FetchPixels.getPixelHeight(9))),
                        borderSide: BorderSide(
                          width: 1,
                          color: R.colors.whiteColor,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(FetchPixels.getPixelHeight(9))),
                        borderSide:
                            BorderSide(width: 1, color: R.colors.whiteColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(FetchPixels.getPixelHeight(9))),
                        borderSide:
                            BorderSide(width: 1, color: R.colors.whiteColor),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: R.colors.whiteColor),
                        borderRadius: BorderRadius.all(
                            Radius.circular(FetchPixels.getPixelHeight(9))),
                      ),
                      isDense: true,
                      // border: InputBorder.none,
                      hintText: s,
                      hintStyle: TextStyle(
                          color: R.colors.whiteColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          fontFamily: Constant.fontsFamily)),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget getRichText(
    String firstText,
    Color firstColor,
    FontWeight firstWeight,
    double firstSize,
    String secondText,
    Color secondColor,
    FontWeight secondWeight,
    double secondSize,
    {TextAlign textAlign = TextAlign.center,
    double? txtHeight}) {
  return RichText(
    textScaleFactor: FetchPixels.getTextScale(),
    textAlign: textAlign,
    text: TextSpan(
        text: firstText,
        style: TextStyle(
          color: firstColor,
          fontWeight: firstWeight,
          fontFamily: Constant.fontsFamily,
          fontSize: firstSize,
          height: txtHeight,
        ),
        children: [
          TextSpan(
              text: secondText,
              style: TextStyle(
                  color: secondColor,
                  fontWeight: secondWeight,
                  fontFamily: Constant.fontsFamily,
                  fontSize: secondSize,
                  height: txtHeight))
        ]),
  );
}

Widget getCardDateTextField(
  BuildContext context,
  String s,
  TextEditingController textEditingController,
  Color fontColor, {
  bool minLines = false,
  EdgeInsetsGeometry margin = EdgeInsets.zero,
  bool isPass = false,
  bool isEnable = true,
  double? height,
  required Function function,
}) {
  FocusNode myFocusNode = FocusNode();
  return StatefulBuilder(
    builder: (context, setState) {
      final mqData = MediaQuery.of(context);
      final mqDataNew =
          mqData.copyWith(textScaleFactor: FetchPixels.getTextScale());

      return AbsorbPointer(
        absorbing: isEnable,
        child: Container(
          height: height,
          margin: margin,
          alignment: Alignment.centerLeft,
          padding:
              EdgeInsets.symmetric(horizontal: FetchPixels.getPixelHeight(18)),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0.0, 4.0)),
              ],
              borderRadius:
                  BorderRadius.circular(FetchPixels.getPixelHeight(12))),
          child: Focus(
              onFocusChange: (hasFocus) {
                if (hasFocus) {
                  setState(() {
                    myFocusNode.canRequestFocus = true;
                  });
                } else {
                  setState(() {
                    myFocusNode.canRequestFocus = false;
                  });
                }
              },
              child: MediaQuery(
                data: mqDataNew,
                child: TextField(
                  maxLines: (minLines) ? null : 1,
                  controller: textEditingController,
                  obscuringCharacter: "*",
                  autofocus: false,
                  focusNode: myFocusNode,
                  obscureText: isPass,
                  showCursor: false,
                  onTap: () {
                    function();
                  },
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontFamily: Constant.fontsFamily),
                  // textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      hintText: s,
                      hintStyle: TextStyle(
                          // color: blackColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: Constant.fontsFamily)),
                ),
              )),
        ),
      );
    },
  );
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var inputText = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var bufferString = StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }

    var string = bufferString.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}

Widget getHorSpace(double verSpace) {
  return SizedBox(
    width: verSpace,
  );
}

Widget getDivider(Color color, double height, double thickness) {
  return Divider(
    color: color,
    height: height,
    thickness: thickness,
  );
}
