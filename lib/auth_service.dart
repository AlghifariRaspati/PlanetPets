import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:planet_pets_app/app/modules/Intro/views/intro_view.dart';
import 'package:planet_pets_app/app/modules/SignUp_SignIn/views/sign_up_sign_in_view.dart';
import 'package:planet_pets_app/app/modules/home/views/navbar.dart';
import 'package:planet_pets_app/verify_email.dart';

class AuthChecker extends StatelessWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return const NavBar();
          } else {
            return IntroView();
          }
        },
      ),
    );
  }
}

class AuthService {
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return const NavBar();
          } else {
            return VerifyEmail();
          }
        });
  }

  // AuthorizeAccess(BuildContext context) {
  //   FirebaseAuth.instance.currentUser().then(user)(FirebaseFirestore.instance
  //       .collection('/User')
  //       .where('uid', isEqualTo: user.uid)
  //       .getDocuments()
  //       .then((docs) {
  //     if (docs.documents[0].exists) {
  //       if (docs.documents[0].data['role'] == 'store owner') {}
  //     }
  //   }));
  // }

  signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    FirebaseAuth.instance.signInWithCredential(credential);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const AuthChecker(),
      ),
    );
  }

  signOut(BuildContext context) async {
    await GoogleSignIn(scopes: ['email']).signOut();

    await FirebaseAuth.instance.signOut();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const AuthChecker(),
      ),
    );
  }
}
