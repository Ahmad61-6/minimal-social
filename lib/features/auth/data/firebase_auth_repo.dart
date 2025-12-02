import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social/features/auth/domain/models/app_user.dart';
import 'package:minimal_social/features/auth/domain/repos/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Future<void> deleteAccount() async{
    try{
      final user = firebaseAuth.currentUser;
      if(user==null){
        throw Exception("User not logged in...");
      }
      user.delete();
      await logout();

    }catch(e){
      debugPrint("---> firebae delete account failed: $e <----");
      throw Exception("Failed to delete account..");

    }
  }

  @override
  Future<AppUser?> getCurrentUser() async {
   try{
    final firebaseUser = firebaseAuth.currentUser;

    if(firebaseUser ==null) return null;

    return AppUser(uid: firebaseUser.uid
    , email: firebaseUser.email!);
    

   }catch(e){
    debugPrint("----->Failed to get the current user: $e <-----");
    throw Exception("Faild to get the current user..");

   }
  }

  @override
  Future<AppUser?> loginWithEmaiPassword(String email, String password) async {
    try{

      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      AppUser user = AppUser(uid: userCredential.user!.uid, email: email); 

      return user;

    }catch(e){
      debugPrint("---->Firbase login error: $e");
      throw Exception('login failed: $e');

    }
  }

  @override
  Future<void> logout() async{
    try{
      await firebaseAuth.signOut();

    }catch(e){
      debugPrint("Firebase signout failed: $e");
      throw Exception("Logout failed..");

    }
  }

  @override
  Future<AppUser?> registerWithEmailPassword(String name, String email, String password) async {
    try{

      final UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      AppUser user = AppUser(uid: userCredential.user!.uid, email: email); 

      return user;


    }catch(e){
      debugPrint("---->Firbase create user error: $e<----");
      throw Exception('login failed: $e');

    }
  }

  @override
  Future<String> sendPasswordResetEmail(String email) async{
    try{
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return "Password reset email, check your inbox";
    }catch(e){
      debugPrint("-----> Something went Wrong: $e<-----");
      return "An error occured $e";
    }
  }

}