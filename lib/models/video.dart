import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Video{
  String userName;
  String uid;
  String id;
  List likes;
  int commentCount;
  int shareCount;
  String songName;
  String caption;
  String videoUrl;
  String thumbanil;
  String profilePhoto;
  Video({
    required this.userName,
    required this.uid,
    required this.id,
    required this.likes,
    required this.commentCount,
    required this.shareCount,
    required this.songName,
    required this.caption,
    required this.videoUrl,
    required this.profilePhoto,
    required this.thumbanil,
});
  Map<String, dynamic> toJson() => {
    "username" : userName,
    "uid" : uid,
    "profilePhoto": profilePhoto,
    "id": uid,
    "likes": likes,
    "commentCount": commentCount,
    "shareCount": shareCount,
    "songName": songName,
    "caption": caption,
    "videoUrl": videoUrl,
    "thumbanil": thumbanil,
  };

  static Video fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return Video(
        profilePhoto: snapshot['profilePhoto'],
        uid:  snapshot['uid'],
        userName: snapshot['username'],
        id: snapshot['id'],
        likes: snapshot['likes'],
        commentCount: snapshot['commentCount'],
        shareCount: snapshot['shareCount'],
        songName: snapshot['songName'],
        caption: snapshot['caption'],
        videoUrl: snapshot['videoUrl'],
        thumbanil: snapshot['thumbanil']
    );
  }
}