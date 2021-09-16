import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qr_bar_code_flutter/models/user_model.dart';

class AuthHelpers {
  Future<String> login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      print('firebaseAUth exception $e');
      return e.message;
    } catch (e) {
      print('Erro in signing in $e');
      return 'Something went wrong please try again later';
    }
  }

  Future<String> signUp(UserModel userModel, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userModel.email, password: password);
      userModel.userId = userCredential.user.uid;
      await addFirstDataToFirestore(userModel);
      return null;
    } on FirebaseAuthException catch (e) {
      print('firebaseAUth exception $e');
      return e.message;
    } catch (e) {
      print('Erro in signing in $e');
      return 'Something went wrong please try again later';
    }
  }

  getCurrentUserData() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .get();
      if (documentSnapshot != null) {
        return UserModel.fromMap(documentSnapshot.data());
      } else
        return null;
    } catch (e) {
      print('Error in getting current User data $e');
      return null;
    }
  }

  Future getUserById(String id) async {
    try {
      QuerySnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .where("userId", isEqualTo: id)
          .get();
      if (documentSnapshot != null) {
        print(id);
        print(documentSnapshot.docs[0].data());
        return UserModel.fromMap(documentSnapshot.docs[0].data());
      } else
        return null;
    } catch (e) {
      print('Error in getting current User data $e');
      return null;
    }
  }

  addFirstDataToFirestore(UserModel userModel) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userModel.userId)
        .set(userModel.toMap());
  }
}
