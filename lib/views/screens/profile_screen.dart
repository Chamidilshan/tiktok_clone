import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String uid;
  ProfileScreen({
    Key? key,
    required this.uid
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            'user name',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: '',
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
                          '10',
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
                          '10',
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
                          '10',
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
                      onTap: () {},
                        child: Text(
                            'Sign Out',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                          ),
                        )
                    ),
                  ),
                ),
                //display video list
              ],
            )
          ],
        ),
      ),
    );
  }
}
