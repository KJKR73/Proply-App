import 'dart:math';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as im;
import 'dart:io' as io;

import 'package:image_picker/image_picker.dart';

class MLTask2 extends StatefulWidget {
  @override
  _MLTask2State createState() => _MLTask2State();
}

class _MLTask2State extends State<MLTask2> {
  io.File _image;
  List<Face> _faces;
  bool loaded = false;
  final imagePicker = ImagePicker();
  final FaceDetector faceDetector = FirebaseVision.instance.faceDetector();
  // Retrieve the image from the camera and get the list of faces
  Future _getImageAndFaces() async {
    dynamic imageFile = await imagePicker.getImage(source: ImageSource.camera);
    im.Image img = im.decodeImage(io.File(imageFile.path).readAsBytesSync());
    dynamic visonImage = FirebaseVisionImage.fromFile(io.File(imageFile.path));
    List<Face> faces = await faceDetector.processImage(visonImage);
    for (Face face in faces) {
      Rect faceu = face.boundingBox;
      print(faceu);
      int left = faceu.left.round();
      int right = faceu.right.round();
      int top = faceu.top.round();
      int bottom = faceu.bottom.round();
      im.Image resized =
          im.copyCrop(img, left, right, right - left, bottom - top);
      print(resized.getBytes());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        child: Column(
          children: <Widget>[
            // Container(
            //   child: Column(
            //     children: <Widget>[
            //       _image == null
            //           ? Container(
            //               height: 200.0,
            //               width: 300.0,
            //               decoration: BoxDecoration(
            //                   image: DecorationImage(
            //                       image: AssetImage('assets/back.jpg'))),
            //             )
            //           : Container(
            //               decoration: BoxDecoration(
            //                   image: DecorationImage(
            //                       image: NetworkImage('temp.png'))),
            //             )
            //     ],
            //   ),
            // ),
            RaisedButton(
              child: Text('Click Here'),
              onPressed: _getImageAndFaces,
            )
          ],
        ),
      ),
    );
  }
}
