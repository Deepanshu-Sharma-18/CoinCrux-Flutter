import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInFirebase {

  static String? _phoneAuthVerificationCode;

  static Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser
        ?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


  static Future signInWithPhone(String phone, BuildContext context) async {
    final completer = Completer<bool>();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 50),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        completer.complete(false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: ${e.message!}'),
        ));
      },
      codeSent: (String verificationId, int? resendToken) {
        _phoneAuthVerificationCode = verificationId;
        completer.complete(true);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    return completer.future;
  }

  static Future<UserCredential> verifySmsCode({
    required BuildContext context,
    required String smsCode,
  }) async {
    final authCredential = PhoneAuthProvider.credential(
        verificationId: _phoneAuthVerificationCode!, smsCode: smsCode);
    final uc =  await FirebaseAuth.instance.signInWithCredential(authCredential);
    // final uc = await FirebaseAuth.instance.currentUser
    //     ?.linkWithCredential(authCredential);
    return uc;
  }



}


