import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_app/models/UserModel.dart';


class AuthServices{
  //instance of firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create a user from uid
  UserModel? _userWithFirebaseUserUid(User? user){
    return user != null ? UserModel(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<UserModel?> get user{
    return _auth.authStateChanges()
    .map((User? user) => _userWithFirebaseUserUid(user));
  }

  //sign in anonymously
  Future signInAnonymously() async{

    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userWithFirebaseUserUid(user);
    } catch(e){
      print(e.toString());
      return null;
    }
    
  }
  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userWithFirebaseUserUid(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userWithFirebaseUserUid(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  //sign out
  Future <void> signOut() async {
    try{
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }
}
