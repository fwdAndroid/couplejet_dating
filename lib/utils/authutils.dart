import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../ui/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'constant.dart';
import 'constants.dart';
import 'customdialog.dart';
import 'package:flutter/material.dart';

class AuthUtils{
  Future<UserCredential> signInWithGoogle() async {

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();


    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;


    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );


    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> facbookLogin()async{
    final LoginResult result = await FacebookAuth.instance.login();
    final AuthCredential facebookCredential =
    FacebookAuthProvider.credential(result.accessToken!.token);
    return
      await FirebaseAuth.instance.signInWithCredential(facebookCredential);
  }
  socialLoginUser(
      BuildContext context
      )async{
    String userName=firebaseAuth.currentUser!.displayName.toString();
    String email=firebaseAuth.currentUser!.email.toString();
    String dob="";
    String gender="";
    String phoneNumber=firebaseAuth.currentUser!.phoneNumber.toString();
    String imageLink=firebaseAuth.currentUser!.photoURL.toString();
    try{
      await firebaseFirestore.collection('users').doc(firebaseAuth.currentUser!.uid).set({
        "id":firebaseAuth.currentUser!.uid,
        'UserName':userName,
        'Email':email,
        "DOB":dob,
        "Gender":gender,
        "Phone Number":phoneNumber,
        "imageLink":imageLink,
        "searchName":searchName(userName),
        "status":"offline"// 'Password':password
      }).then((value) {
        Customdialog().showInSnackBar("Logged in", context);
        // Provider.of<CircularProgressProvider>(context,listen: false).setValue(false);
        Customdialog.closeDialog(context);
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (_) => BottomNavBar()), (
            route) => false);

      });
    }on FirebaseAuthException catch(e){
      Navigator.pop(context);

      Customdialog.showBox(context,e.toString());


    }
  }
  Future<UserCredential?> signInWithFacebook() async {
    try {
      final AccessToken accessToken = (await FacebookAuth.instance.login()) as AccessToken;

      // Create a credential from the access token
      final OAuthCredential credential = FacebookAuthProvider.credential(
        accessToken.token,
      );
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }  catch (e) {
      // handle the FacebookAuthException
    } on FirebaseAuthException catch (e) {
      // handle the FirebaseAuthException
    } finally {}
    return null;
  }
  searchName(String name) {
    List<String> caseSearchList = [];
    String temp = "";
    for (int i = 0; i < name.length; i++) {
      temp = temp + name[i].toLowerCase();
      caseSearchList.add(temp);
    }
    return caseSearchList;
  }
}