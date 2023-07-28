import 'package:flutter/material.dart';
import 'package:tiktok_clone/views/widgets/video_player_item.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({Key? key}) : super(key: key);

  buildProfile(String profilePhoto){
    return SizedBox(
      width: 50.0,
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image(
                    image: NetworkImage(profilePhoto),
                    fit: BoxFit.cover,
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
            padding: EdgeInsets.all(20.0),
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
      body: PageView.builder(
        itemCount: 2,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                VideoPlayerItem(videoUrl: ''),
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
                                  'userName',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  'caption',
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
                                      'song name',
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
                              buildProfile('url'),
                            Column(
                              children: [
                                InkWell(
                                  child: Icon(
                                    Icons.favorite,
                                    size: 40.0,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  '2200 likes',
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
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  '200',
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
                                  '200',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white
                                  ),
                                ),
                              ],
                            ),
                              CircleAvatar(
                                child : buildMusicAlbum(
                                  'profile photo'
                                )
                              )
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
      ),
    );
  }
}
