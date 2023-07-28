import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/controllers/comment_controller.dart';
import 'package:timeago/timeago.dart' as tago;

class CommentScreen extends StatelessWidget {
  final String id;
  CommentScreen({
    Key? key,
    required this.id
  }) : super(key: key);

  final TextEditingController _commentController = TextEditingController();
  CommentController commentController = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    commentController.updatePostId(id);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                  child:Obx(
                          () {
                      return ListView.builder(
                        itemCount: commentController.comments.length,
                          itemBuilder: (context, index){
                          final comment = commentController.comments[index];
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.black,
                                backgroundImage: NetworkImage(comment.profilePhoto),
                              ),
                              title: Row(
                                children: [
                                  Text(
                                      '${comment.username}  ',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  Text(
                                     comment.comment,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  Text(
                                      tago.format(
                                          comment.datePublished.toDate()
                                      ),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    '${comment.likes.length} likes',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: InkWell(
                                child: Icon(
                                  Icons.favorite,
                                  size: 25.0,
                                  color: comment.likes.contains(authController.user.uid)
                                      ?Colors.red
                                      :Colors.white
                                ),
                                onTap: () {
                                  commentController.likeComment(comment.id);
                                },
                              ),
                            );
                          }
                      );
                    }
                  )
              ),
              Divider(),
              ListTile(
                title: TextFormField(
                  controller: _commentController,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Comment',
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)
                    ),
                  ),
                ),
                trailing: TextButton(
                  child: Text(
                      'Send',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0
                    ),
                  ),
                  onPressed: () {
                    commentController.postComment(_commentController.text);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
