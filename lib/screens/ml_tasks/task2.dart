import 'dart:convert';
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
  im.Image _image;
  final imagePicker = ImagePicker();
  final FaceDetector faceDetector = FirebaseVision.instance.faceDetector();

  // Retrieve the image from the camera and get the list of faces
  Future _getImageAndFaces() async {
    dynamic imageFile = await imagePicker.getImage(source: ImageSource.camera);
    im.Image img = im.decodeImage(io.File(imageFile.path).readAsBytesSync());
    dynamic visonImage = FirebaseVisionImage.fromFile(io.File(imageFile.path));
    List<Face> faces = await faceDetector.processImage(visonImage);
    for (Face face in faces) {
      Rect faceDims = face.boundingBox;
      print(faceDims);
      int left = faceDims.left.round();
      int right = faceDims.right.round();
      int top = faceDims.top.round();
      int bottom = faceDims.bottom.round();
      im.Image resized =
          im.copyCrop(img, left, right, right - left, bottom - top);
      print(resized);
      setState(() {
        _image = resized;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        child: Column(
          children: <Widget>[
            // _image == null ? Container(
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: FileImage(_image)
            //     ),
            //   ),
            // )
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
