import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController with ChangeNotifier {
  // Object
  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;

  // function for login
  login() async {
    googleSignInAccount = await _googleSignIn.signIn();

    notifyListeners();
  }

  //function for  logout
  logout() async {
    googleSignInAccount = await _googleSignIn.signOut();

    notifyListeners();
  }
}
