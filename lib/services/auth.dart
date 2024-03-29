
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth=FirebaseAuth.instance;

  Stream<User?> get user{
    return _auth.authStateChanges();
  }

  Future loginInWithEmailAndPassword(String email,String password)async{
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
}

  Future registerUserWithEmailAndPassword(String email,String password)async{
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
  Future signOutTheUser(){
    return _auth.signOut();
  }
}