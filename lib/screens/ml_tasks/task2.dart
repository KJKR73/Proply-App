import 'dart:convert';
import 'package:ethinicty_recognition_app/customs/result_display.dart';
import 'package:ethinicty_recognition_app/shared/constant.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'dart:io' as io;

import 'package:image_picker/image_picker.dart';

class MLTask2 extends StatefulWidget {
  @override
  _MLTask2State createState() => _MLTask2State();
}

class _MLTask2State extends State<MLTask2> {
  List<Map> _faceDataDisplay;
  final imagePicker = ImagePicker();
  io.File _image;

  // Retrieve the image from the camera and get the list of faces
  Future _getImageAndFaces() async {
    // Retrieve the image from user////////////////////////////////////////
    dynamic imageFile = await imagePicker.getImage(
      source: ImageSource.camera,
      maxHeight: 500,
      maxWidth: 300,
    );

    //im.Image img = im.decodeImage(io.File(imageFile.path).readAsBytesSync());
    final imageBytes = io.File(imageFile.path).readAsBytesSync();
    String base64Image = base64Encode(imageBytes);
    /////////////////////////////////////////////////////////////////////////

    // Post request to the endpoint to get the result
    var url = 'http://52.66.206.153:8080/predictions';
    Map data = {
      'query': base64Image,
    };
    var body = json.encode(data);
    var response = await post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    /////////////////////////////////////////////////

    if (response.statusCode != 200) {
      print('Some Error at the backend occured please check you code again');
    }

    // Manuplate the response to get the predictions
    Map faceData = json.decode(response.body);
    List<Map> faceDataTemp = [];
    faceData.forEach((key, value) {
      faceDataTemp.add(value);
    });
    setState(() {
      _faceDataDisplay = faceDataTemp;
      _image = io.File(imageFile.path);
    });
    ////////////////////////////////////////////////
  }

  @override
  Widget build(BuildContext context) {
    dynamic queryData = MediaQuery.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        child: Icon(
          Icons.image,
          color: Colors.white,
        ),
        onPressed: () async {
          await _getImageAndFaces();
        },
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.0),
                  color: Colors.blue[900],
                ),
                child: Text(
                  'Click on the button below to see the results',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  children: <Widget>[
                    _image == null
                        ? emptyImage(
                            queryData.size.height, queryData.size.width)
                        : displayPictureTask2(
                            this._image,
                            queryData.size.height,
                            queryData.size.width,
                          )
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ButtonTheme(
                height: 60.0,
                minWidth: 300.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: _image == null
                      ? null
                      : () {
                          Navigator.pushNamed(
                            context,
                            '/summary',
                            arguments: {
                              'face_data': _faceDataDisplay,
                            },
                          );
                        },
                  color: Colors.blue,
                  child: Text(
                    'Click Here',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 70,
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    _image == null ? 'Step 2 click button above' : "",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
              Align(
                child: Text(
                  _image == null ? 'Step 1 click a photo from here --->' : '',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
