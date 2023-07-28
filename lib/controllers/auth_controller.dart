import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/models/user.dart' as model;
import 'package:tiktok_clone/views/screens/auth/home_screen.dart';
import 'package:tiktok_clone/views/screens/auth/login_screen.dart';


class AuthController extends GetxController{
  static AuthController instance = Get.find();

  late Rx<File?> _pickedImage;
  late Rx<User?> _user;

  File? get profilePhoto => _pickedImage.value;

  @override
  void onReady(){
    super.onReady();
    print('hello');
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user){
    if(user == null){
      Get.offAll(()=>LoginScreen());
    }else{
      Get.off(()=>HomeScreen());
    }
  }
  //pick image
  void pickImage() async{
    final pickedImage = await ImagePicker()
        .pickImage(
        source: ImageSource.gallery
    );
    if(pickedImage != null){
      Get.snackbar('Profile Picture', 'You have successfully selected your profile picture');
    }
    _pickedImage = Rx<File?> (File(pickedImage!.path));
  }
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
        model.User user = model.User(
            name: userName,
            profilePhoto: downloadUrl,
            email: email,
            uid: cred.user!.uid
        );

        await firestore.collection('users').doc(cred.user!.uid).set(user.toJson());
      } else{
        Get.snackbar('Error Creating Account', 'Please enter all the fields');
      }
    } catch(e){
      Get.snackbar('Error Creating Account', e.toString());
    }
  }

  //login user
  void loginUser(String email, String password) async{
    try{
      if(password.isNotEmpty
          && email.isNotEmpty){
        await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
        print('logged success');
      }else{
        Get.snackbar('Error Login', 'Please enter all the fields');
      }
    }catch(e){
      Get.snackbar('Error Login', e.toString());
    }
  }
}