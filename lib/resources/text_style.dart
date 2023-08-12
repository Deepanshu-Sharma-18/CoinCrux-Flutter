import 'package:flutter/cupertino.dart';

import '../resources/resources.dart';

class AppTextStyle {
  ///textstyles///

  TextStyle regularLato() {
    return TextStyle(
      fontSize: 12,
      fontFamily: 'Lato',
      letterSpacing: 0.05,
      color: R.colors.blackColor,
      fontWeight: FontWeight.w400,
    );
  }  
  TextStyle mediumLato() {
    return TextStyle(
      fontSize: 12,
      fontFamily: 'Lato',
      letterSpacing: 0.05,
      color: R.colors.blackColor,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle semiBoldLato() {
    return TextStyle(
      fontSize: 12,
      fontFamily: 'Lato',
      letterSpacing: 0.05,
      color: R.colors.blackColor,
      fontWeight: FontWeight.w600,
    );
  }


}
