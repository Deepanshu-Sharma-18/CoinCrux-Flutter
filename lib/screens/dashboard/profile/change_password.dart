import 'package:flutter/material.dart';

import '../../../base/resizer/fetch_pixels.dart';
import '../../../base/widget_utils.dart';
import '../../../resources/resources.dart';
import '../../../widgets/my_button.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController oldPasswordController = TextEditingController();
  FocusNode oldPassFN = FocusNode();
  TextEditingController newPasswordController = TextEditingController();
  FocusNode newPassFN = FocusNode();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode conFirmPassFN = FocusNode();
  bool oldPassVisible = false;
  bool newPassVisible = false;bool confirmPassVisible = false;
  @override
  void dispose() {
    // TODO: implement dispose
    newPassFN.dispose();
    newPasswordController.dispose();
    oldPassFN.dispose();
    oldPasswordController.dispose();
    conFirmPassFN.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
          "Change Password",
          style: R.textStyle
              .mediumLato()
              .copyWith(fontSize: FetchPixels.getPixelHeight(17)),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: getPaddingWidget(
            EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getVerSpace(FetchPixels.getPixelHeight(20)),
                getAssetImage(R.images.logo,
                    height: FetchPixels.getPixelHeight(100),
                    width: FetchPixels.getPixelWidth(200)),
                getVerSpace(FetchPixels.getPixelHeight(10)),
                Text(
                  "Change Password?",
                  style: R.textStyle.mediumLato().copyWith(
                        fontSize: 16,
                        color: R.colors.blackColor,
                      ),
                ),
                getVerSpace(FetchPixels.getPixelHeight(5)),
                Text(
                  "Password Must Consist of at Least 6 Characters",
                  maxLines: 2,
                  style: R.textStyle.regularLato().copyWith(
                        fontSize: 13,
                        // color: R.colors.lightcolor,
                      ),
                  textAlign: TextAlign.center,
                ),
                getVerSpace(FetchPixels.getPixelHeight(40)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Old Password",
                    style: R.textStyle
                        .mediumLato()
                        .copyWith(fontSize: 12, color: R.colors.blackColor),
                  ),
                ),
                getVerSpace(FetchPixels.getPixelHeight(10)),
                TextFormField(
                    cursorColor: R.colors.blackColor,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: R.textStyle
                        .mediumLato()
                        .copyWith(color: R.colors.blackColor, fontSize: 14),
                    obscureText: oldPassVisible,
                    controller: oldPasswordController,
                    focusNode: oldPassFN,
                    onTap: () {
                      setState(() {});
                    },
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    // validator: (value) =>
                    //     FieldValidator.validatePassword(value!),
                    decoration: R.decorations.textFormFieldDecoration(
                        InkWell(
                          onTap: () {
                            oldPassVisible = !oldPassVisible;
                            setState(() {});
                          },
                          child: Icon(
                              !oldPassVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: oldPassFN.hasFocus
                                  ? R.colors.theme
                                  : R.colors.unSelectedIcon),
                        ),
                        'Enter Old Password')),
                getVerSpace(FetchPixels.getPixelHeight(20)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "New Password",
                    style: R.textStyle
                        .mediumLato()
                        .copyWith(fontSize: 12, color: R.colors.blackColor),
                  ),
                ),
                getVerSpace(FetchPixels.getPixelHeight(10)),
                TextFormField(
                    cursorColor: R.colors.blackColor,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: R.textStyle
                        .mediumLato()
                        .copyWith(color: R.colors.blackColor, fontSize: 14),
                    obscureText: newPassVisible,
                    controller: newPasswordController,
                    focusNode: newPassFN,
                    onTap: () {
                      setState(() {});
                    },
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    // validator: (value) =>
                    //     FieldValidator.validatePassword(value!),
                    decoration: R.decorations.textFormFieldDecoration(
                        InkWell(
                          onTap: () {
                            newPassVisible = !newPassVisible;
                            setState(() {});
                          },
                          child: Icon(
                              !newPassVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: newPassFN.hasFocus
                                  ? R.colors.theme
                                  : R.colors.unSelectedIcon),
                        ),
                        'Enter Password')),
                getVerSpace(FetchPixels.getPixelHeight(10)),
                TextFormField(
                    cursorColor: R.colors.blackColor,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    style: R.textStyle
                        .mediumLato()
                        .copyWith(color: R.colors.blackColor, fontSize: 14),
                    obscureText: confirmPassVisible,
                    controller: confirmPasswordController,
                    focusNode: conFirmPassFN,
                    onTap: () {
                      setState(() {});
                    },
                    // validator: (value) =>
                    //     FieldValidator.validatePasswordMatch(
                    //         value!, newPasswordController.text),
                    decoration: R.decorations.textFormFieldDecoration(
                        InkWell(
                            onTap: () {
                              confirmPassVisible = !confirmPassVisible;
                              setState(() {});
                            },
                            child: Icon(
                              !confirmPassVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: conFirmPassFN.hasFocus
                                  ? R.colors.theme
                                  : R.colors.unSelectedIcon,
                            )),
                        'Confirm Password')),
                getVerSpace(FetchPixels.getPixelHeight(40)),
                MyButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {}
                    },
                    buttonText: "UPDATE")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
