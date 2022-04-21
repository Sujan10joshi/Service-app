import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:service_app/model/user_details.dart';

class LoginController with ChangeNotifier {
  // Object
  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;
  UserDetails? userDetails;

  // function for google login
  googleLogin() async {
    googleSignInAccount = await _googleSignIn.signIn();

    userDetails = UserDetails(
      displayName: googleSignInAccount!.displayName,
      email: googleSignInAccount!.email,
      photoURL: googleSignInAccount!.photoUrl,
    );

    notifyListeners();
  }

  // function for logout
  logout() async {
    googleSignInAccount = await _googleSignIn.signOut();

    userDetails = null;
    notifyListeners();
  }
}
