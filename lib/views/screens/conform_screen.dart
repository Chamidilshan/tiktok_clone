import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tiktok_clone/controllers/upload_video_controller.dart';
import 'package:tiktok_clone/views/widgets/text_input_field.dart';
import 'package:video_player/video_player.dart';

class ConfirmScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;
  const ConfirmScreen({
    Key? key,
    required this.videoFile,
    required this.videoPath
  }) : super(key: key);

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {

  late VideoPlayerController controller;
  TextEditingController _songController = TextEditingController();
  TextEditingController _captionController = TextEditingController();
  bool isUploaded = false;
  bool isPressed = false;

  UploadVideoController uploadVideoController = Get.put(UploadVideoController());

  @override
  void initState(){
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(0.5);
    controller.setLooping(true);
  }

  @override
  void dispose(){
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: !isPressed,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/1.5,
                child: VideoPlayer(controller),
              ),
              SizedBox(
                height: 30.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10.0, right: 10.0),
                        width: MediaQuery.of(context).size.width-20,
                        child: TextInputField(
                          controller: _songController,
                          labelText: 'Song Name',
                          icon: Icons.music_note,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0, right: 10.0),
                        width: MediaQuery.of(context).size.width-20,
                        child: TextInputField(
                          controller: _captionController,
                          labelText: 'Caption',
                          icon: Icons.closed_caption,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isPressed = true;
                            });
                            uploadVideoController.uploadVideo(
                                _songController.text,
                                _captionController.text,
                              widget.videoPath
                            );
                          },
                          child: Text(
                            'Share',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white
                            ),
                          )
                      )
                    ],
                  ),
              )
            ],
          ),
        ),
        replacement: Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
