import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../failure/custom_exceptions.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> deleteUser() async {
    await _firebaseAuth.currentUser!.delete();
  }

  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    log('Started creating user...');
    try {
      // Firebase's method to create a user with email and password
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Log the user's email for debugging
      log('Firebase response: ${userCredential.user?.email}');

      if (userCredential.user != null) {
        log('User created successfully');
        return userCredential.user;
      } else {
        log('User is null after signUp');
      }
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException caught: ${e.message}');
      if (e.code == 'email-already-in-use') {
        throw CustomExceptions('يوجد مستخدم مسجل بهذا البريد الالكتروني');
      } else if (e.code == 'invalid-email') {
        throw CustomExceptions('البريد الالكتروني غير صالح');
      } else if (e.code == 'weak-password') {
        throw CustomExceptions('كلمة المرور ضعيفة');
      } else {
        throw CustomExceptions(e.message ??
            'Authentication error'); // Handle other FirebaseAuthException cases
      }
    } catch (e) {
      log('Generic exception caught: $e');
      throw CustomExceptions('حدث خطأ في عملية التسجيل');
    }
    log('Returning null (user creation failed)');
    return null;
  }

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    log('Started signing in user...');
    try {
      // Firebase's method to sign in a user with email and password
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Log the user's email for debugging
      log('Firebase response: ${userCredential.user?.email}');

      if (userCredential.user != null) {
        log('User signed in successfully');
        return userCredential.user;
      } else {
        log('User is null after signIn');
      }
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException caught: ${e.message}');
      if (e.code == 'user-not-found') {
        throw CustomExceptions(" لا يوجد مستخدم بهذا البريد الالكتروني");
      } else if (e.code == 'wrong-password') {
        throw CustomExceptions('طلب كلمة المرور غير صحيحة');
      } else {
        throw Exception(e.message ??
            'خطأ في تسجيل الدخول'); // Handle other FirebaseAuthException cases
      }
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await _firebaseAuth.signInWithCredential(credential)).user!;
  }

  // Future<User> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

  //   // Once signed in, return the UserCredential
  //   return (await _firebaseAuth.signInWithCredential(facebookAuthCredential))
  //       .user!;
  // }

bool isLoggedIn(){
  return  _firebaseAuth.currentUser != null;
}

}
