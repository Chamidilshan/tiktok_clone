import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/controllers/video_controller.dart';
import 'package:tiktok_clone/views/screens/comments_screen.dart';
import 'package:tiktok_clone/views/screens/profile_screen.dart';
import 'package:tiktok_clone/views/widgets/video_player_item.dart';

class VideoScreen extends StatelessWidget {
  VideoScreen({Key? key}) : super(key: key);
  
  final VideoController videoController = Get.put(VideoController());

  buildProfile(String profilePhoto){
    return SizedBox(
      width: 60.0,
      height: 60.0,
      child: Stack(
        children: [
          Positioned(
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0)
                ),
                child: InkWell(
                  onTap: (){
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context)=>ProfileScreen(uid:  )
                    //     )
                    // )
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image(
                      image: NetworkImage(profilePhoto),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            left: 5.0,
          )
        ],
      ),
    );
  }

  buildMusicAlbum(String profilePhoto){
    return SizedBox(
      width: 60.0,
        height: 60.0,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(6.0),
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey,
                  Colors.white
                ]
              ),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image(
                image: NetworkImage(profilePhoto),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(
              () {
          return PageView.builder(
            itemCount: videoController.videoList.length,
              controller: PageController(initialPage: 0, viewportFraction: 1),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
              final data = videoController.videoList[index];
                return Stack(
                  children: [
                    VideoPlayerItem(videoUrl: data.videoUrl),
                    Column(
                      children: [
                        SizedBox(
                          height: 100.0,
                        ),
                        Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.username,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      data.caption,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.music_note,
                                          size: 15.0,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          data.songName,
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 100.0,
                              margin: EdgeInsets.only(top: size.height/5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildProfile(data.profilePhoto),
                                Column(
                                  children: [
                                    InkWell(
                                      child: Icon(
                                        Icons.favorite,
                                        size: 40.0,
                                        color: data.likes.contains(
                                            authController.user.uid)
                                            ? Colors.red
                                            : Colors.white
                                      ),
                                      onTap: (){
                                        videoController.likeVideo(data.id);
                                      }
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Text(
                                      data.likes.length.toString(),
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white
                                      ),
                                    ),
                                  ],
                                ),
                                  Column(
                                  children: [
                                    InkWell(
                                      child: Icon(
                                        Icons.comment,
                                        size: 40.0,
                                        color: Colors.white,
                                      ),
                                      onTap: (){
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context)=>CommentScreen(id: data.id,)
                                            )
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Text(
                                      data.commentCount.toString(),
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white
                                      ),
                                    ),
                                  ],
                                ),
                                  Column(
                                  children: [
                                    InkWell(
                                      child: Icon(
                                        Icons.reply,
                                        size: 40.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Text(
                                      data.shareCount.toString(),
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white
                                      ),
                                    ),
                                  ],
                                ),
                                  buildMusicAlbum(
                                    data.profilePhoto
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                        )
                      ],
                    )
                  ],
                );
              }
          );
        }
      ),
    );
  }
}
