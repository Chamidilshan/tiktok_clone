import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/models/video.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController{

  _compressVideo(String videoPath) async{
    final compressedVideo = await VideoCompress.compressVideo(
        videoPath,
        quality: VideoQuality.MediumQuality
    );
    return compressedVideo!.file;
  }

  Future<String> _uploadVideoToStorage(String id, String videoPath) async{
    Reference ref = firebaseStorage.ref().child('videos').child(id);
    UploadTask uploadTask = ref.putFile(await _compressVideo(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  _getThumbanil(String videoPath) async{
    final thumbanil = await VideoCompress.getFileThumbnail(videoPath);
    return thumbanil;
  }

  Future<String> _uploadImageToStorage(String id, String videoPath) async{
    Reference ref = firebaseStorage.ref().child('videos').child(id);
    UploadTask uploadTask = ref.putFile(await _getThumbanil(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
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

      String videoUrl = await _uploadVideoToStorage('Video $len', videoPath);
      String thumbanil = await _uploadImageToStorage('Video $len', videoPath);
      Video video = Video(
          userName: (userDoc.data()! as Map<String, dynamic>)['name'],
          uid: uid,
          id: 'Video $len',
          likes: [],
          commentCount: 0,
          shareCount: 0,
          songName: songName,
          caption: caption,
          videoUrl: videoUrl,
          profilePhoto: (userDoc.data()! as Map<String, dynamic>)['profilePhoto'],
          thumbanil: thumbanil
      );

      await fireStore.collection('videos').doc('Video $len').set(video.toJson());
      Get.back();
    } catch(e){
      Get.snackbar('Error Uploading Video', e.toString());
    }
  }
}