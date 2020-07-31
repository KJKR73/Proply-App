import 'dart:convert';
import 'package:http/http.dart';
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
  String test;

  // Retrieve the image from the camera and get the list of faces
  Future _getImageAndFaces() async {
    dynamic imageFile = await imagePicker.getImage(
      source: ImageSource.camera,
      maxHeight: 500,
      maxWidth: 500,
    );
    im.Image img = im.decodeImage(io.File(imageFile.path).readAsBytesSync());
    final imageBytes = io.File(imageFile.path).readAsBytesSync();
    String base64Image = base64Encode(imageBytes);
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
            // _image == null
            //     ? Container(
            //         child: Text('dsds'),
            //       )
            //     : Text("test"),
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
