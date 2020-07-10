//imports
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository{

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  //Constructor
  UserRepository({FirebaseAuth firebaseAuth, GoogleSignIn googleSignIn})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
    _googleSignIn = googleSignIn ?? GoogleSignIn();

  //SignInWithGoogle

  Future<FirebaseUser> singInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken, 
      accessToken: googleAuth.accessToken
    );

    await _firebaseAuth.signInWithCredential(credential);
    return _firebaseAuth.currentUser(); 
  }

  //SignInWithCredentials

  Future<void> signInWithCredentials(String email, String password) => 
    _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

  //SignUp
  Future<void> signUp(String email, String password) async => 
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

  //SignOut
  Future<void> signOut() async => Future.wait([
    _firebaseAuth.signOut(),
    _googleSignIn.signOut()
  ]);

  //isLogged?
  Future<bool> isSignedIn() async => _firebaseAuth.currentUser() != null;

  //getUser
  Future<String> getUser() async => (await _firebaseAuth.currentUser()).email;


}

