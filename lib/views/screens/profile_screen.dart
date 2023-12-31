import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/controllers/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  final String uid;
  ProfileScreen({
    Key? key,
    required this.uid
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  void initState(){
    super.initState();
    profileController.updateUserId(widget.uid);
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        if(controller.user.isEmpty){
          return Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black12,
            leading: Icon(
                Icons.person_add_alt_1_outlined
            ),
            actions: [
              Icon(Icons.more_horiz),
            ],
            title: Text(
                controller.user['name'],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: controller.user['profilePhoto'],
                              fit: BoxFit.cover,
                              height: 100.0,
                              width: 100.0,
                              placeholder: (context, url)=>
                                CircularProgressIndicator(color: Colors.white,),
                              errorWidget: (context, url, error)=>
                                Icon(Icons.error)
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                controller.user['following'],
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                height: 6.0,
                              ),
                              Text(
                                'Following',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              SizedBox(
                                height: 6.0,
                              )
                            ],
                          ),
                          Container(
                            color: Colors.black54,
                            width: 1.0,
                            height: 54.0,
                            margin: EdgeInsets.symmetric(horizontal: 15.0),
                          ),
                          Column(
                            children: [
                              Text(
                                controller.user['followers'],
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                height: 6.0,
                              ),
                              Text(
                                'Followers',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              SizedBox(
                                height: 6.0,
                              )
                            ],
                          ),
                          Container(
                            color: Colors.black54,
                            width: 1.0,
                            height: 54.0,
                            margin: EdgeInsets.symmetric(horizontal: 15.0),
                          ),
                          Column(
                            children: [
                              Text(
                                controller.user['likes'],
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                height: 6.0,
                              ),
                              Text(
                                'Likes',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              SizedBox(
                                height: 6.0,
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        width: 140.0,
                        height: 47.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black12
                          )
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              if(widget.uid == authController.user.uid){
                                authController.signOut();
                              } else{
                                controller.followUser();
                              }
                            },
                              child: Text(
                                widget.uid == authController.user.uid
                                    ? 'Sign Out'
                                    : controller.user['isFollowing']
                                      ? 'Unfollow'
                                      : 'Follow',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                          ),
                        ),
                      ),
                      //display video list
                      GridView.builder(
                        itemCount: controller.user['thumbnails'].length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 1,
                          ),
                          itemBuilder: (context, index){
                            String thumbnail = controller.user['thumbnails'][index];
                            return CachedNetworkImage(
                                imageUrl: thumbnail,
                              fit: BoxFit.cover,
                            );
                          }
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
