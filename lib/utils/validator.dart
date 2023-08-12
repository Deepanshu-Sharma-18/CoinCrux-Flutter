class FieldValidator {
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please Enter email address';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Invalid Email';
    }
    if (value.contains(" ")) {
      return 'Invalid Email';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) return 'Please enter password';
    if (value.length < 6) {
      return "Enter at least 6 characters";
    }


    return null;
  }

  static String? validatePasswordMatch(String value, String pass2) {
    if (value.isEmpty) return "Confirm password is required";
    if (value != pass2) {
      return 'Password didn\'t match';
    }
    return null;
  }

  static String? validateName(String value) {
    if (value.isEmpty) {
      return 'Please enter your name';
    }

    if (!RegExp(r"^[A-Z a-z]{2,25}$").hasMatch(value)) {
      return 'Incorrect name';
    }

    return null;
  }
  static String? validateFirstName(String value) {
    if (value.isEmpty) {
      return 'Please enter your first name';
    }

    if (!RegExp(r"^[A-Z a-z]{2,25}$").hasMatch(value)) {
      return 'Incorrect first name';
    }

    return null;
  }  static String? validateLastName(String value) {
    if (value.isEmpty) {
      return 'Please enter your last name';
    }

    if (!RegExp(r"^[A-Z a-z]{2,25}$").hasMatch(value)) {
      return 'Incorrect last name';
    }

    return null;
  }

  static String? checkEmpty(String value) {
    if (value.isEmpty) {
      return 'required field';
    }

    return null;
  }




  static String? validatePhoneNumber(String value) {
    print("validatepassword : $value ");

    if (value.isEmpty) return "Please enter your phone number";
    if (value.length <= 8) {
      return "Invalid number";
    }

    String pattern = r'(^(?:[+0]9)?[0-9]{9,15}$)';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value.trim())) {
      return "Invalid Number";
    }
    return null;
  }
  static String? validateDebitCardNumber(String value) {
    print("validatepassword : $value ");

    if (value.isEmpty) return "Please enter Card Nummber";
    if (value.length <=15) {
      return "Enter 16 Digit Debit card number";
    }

    String pattern = r'(^(?:[+0]9)?[0-9]{9,16}$)';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value.trim())) {
      return "Enter 16 Digit Debit card number";
    }
    return null;
  }

  static String? validateDateOfBirth(String? value) {
    if (value!.isEmpty) {
      return "DOB is Required";
    }
    return null;
  }
  static String? validateCvvNumber(String? value) {
    if (value!.isEmpty) {
      return "CVV is Required";
    }
    return null;
  }
  static String? validateDateOfExpire(String? value) {
    if (value!.isEmpty) {
      return "Please Enter Date of expire";
    }
    return null;
  }

  static String? validateRole(String? value) {
    if (value!.isEmpty) {
      return "Please select role";
    }
    return null;
  }

  static String? validatePatient(String? value) {
    if (value!.isEmpty) {
      return "Please select patient";
    }
    return null;
  }

  static String? validateGender(String? value) {
    if (value!.isEmpty) {
      return "Please select gender";
    }
    return null;
  }

  static String? validatePinCode(String? value) {
    if (value!.isEmpty) {
      return "Incorrect PINCODE";
    }
    return null;
  }

  static String? validateMilage(String? value) {
    if (value!.isEmpty) {
      return "Milage Required";
    }
    return null;
  }

  static String? validateColor(String? value) {
    if (value!.isEmpty) {
      return "Color Required";
    }
    return null;
  }

  static String? validateDetails(String? value) {
    if (value!.isEmpty) {
      return " Details Required";
    }
    return null;
  }

  static String? validatePrice(String? value) {
    if (value!.isEmpty) {
      return "Please Enter Price";
    }
    return null;
  }

  static String? validateCvv(String? value) {
    if (value!.isEmpty) {
      return "Enter CVV Number";
    }
    return null;
  }

}
