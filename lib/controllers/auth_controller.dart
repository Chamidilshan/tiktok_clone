import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:flutter/material.dart';


class AuthController extends GetxController{

  //upload userImage
  Future<String> _uploadToStorage(File image) async{
    Reference ref = firebaseStorage.ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl; //return upload image url
  }
  //register the user
  void registerUser(
      String userName,
      String email,
      String password,
      File? image
      ) async{
    try{
      if(userName.isNotEmpty
          && password.isNotEmpty
          && email.isNotEmpty
          && image != null){

        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email,
            password: password
        );

        String downloadUrl = await _uploadToStorage(image);
      }
    } catch(e){
      Get.snackbar('Error Creating Account', e.toString());
    }
  }
}