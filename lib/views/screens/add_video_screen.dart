import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/screens/conform_screen.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({Key? key}) : super(key: key);

  pickVideo(ImageSource src, BuildContext context) async{
    final video = await ImagePicker().pickVideo(source: src);
    if(video != null){
      Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context)=>ConfirmScreen(
                videoFile: File(video.path),
                videoPath: video.path,
              )
          )
      );
    }
  }

  showOptionsDialog(BuildContext context){
    return showDialog(
        context: context,
        builder: (context)=> SimpleDialog(
          children: [
            SimpleDialogOption(
              onPressed: () {
                pickVideo(ImageSource.gallery, context);
              },
              child: Row(
                children: [
                  Icon(Icons.image),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Gallery',
                      style: TextStyle(
                        fontSize: 20.0
                      ),
                    ),
                  )
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                pickVideo(ImageSource.camera, context);
              },
              child: Row(
                children: [
                  Icon(Icons.camera_alt),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Camera',
                      style: TextStyle(
                        fontSize: 20.0
                      ),
                    ),
                  )
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Row(
                children: [
                  Icon(Icons.cancel),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Cancel',
                      style: TextStyle(
                        fontSize: 20.0
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            showOptionsDialog(context);
          },
          child: Container(
            width: 190.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: buttonColor
            ),
            child: Center(
              child: Text(
                  'Add Video',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
