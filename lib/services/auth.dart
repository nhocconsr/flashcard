import 'package:duelingo_flashcard/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance; 

  //create user obj based on FirebaseUser
 User _userFromFirebaseUser(FirebaseUser user){
   return user != null ? User(uid: user.uid) : null;
 }

//auth change user stream
Stream<User> get user{
  return _auth.onAuthStateChanged
  .map(_userFromFirebaseUser);
}


// anonymous
Future signInAnon() async {
  try{
    AuthResult result = await _auth.signInAnonymously();
    FirebaseUser user = result.user;
    // print(user.toString());
    return _userFromFirebaseUser(user);
  } catch(e){
    print (e.toString());
    return null;
  }
}


// sign in with email & passward


// register with email and password


// sign out


}