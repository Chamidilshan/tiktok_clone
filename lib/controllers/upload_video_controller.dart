import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';

class UploadVideoController extends GetxController{

  _compressVideo(String videoPath){

  }

  _uploadVideoToStorage(String id, String videoPath){
    Reference ref = firebaseStorage.ref().child('videos').child(id);
    ref.putFile(_compressVideo(videoPath));
  }

  //upload video
  uploadVideo(
      String songName,
      String caption,
      String videoPath
      ) async{
    try{
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc = await fireStore.collection('users').doc(uid).get();

      var allDocs = await fireStore.collection('videos').get();
      int len = allDocs.docs.length;

      _uploadVideoToStorage('Video $len', videoPath);
    } catch(e){

    }
  }
}