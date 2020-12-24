import 'dart:convert';
import 'package:ethinicty_recognition_app/customs/result_display.dart';
import 'package:ethinicty_recognition_app/shared/constant.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'dart:io' as io;
import 'package:fluttertoast/fluttertoast.dart';

import 'package:image_picker/image_picker.dart';

class MLTask2 extends StatefulWidget {
  @override
  _MLTask2State createState() => _MLTask2State();
}

class _MLTask2State extends State<MLTask2> {
  List<Map> _faceDataDisplay;
  final imagePicker = ImagePicker();
  io.File _image;
  String _error;
  // Retrieve the image from the camera and get the list of faces
  Future _getImageAndFaces() async {
    // Retrieve the image from user////////////////////////////////////////
    try {
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
    } catch (err) {
      setState(() {
        _error = 'Backend error';
        Fluttertoast.showToast(
          msg: "Error: Photo not found or face not detected in photo",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.black,
          fontSize: 16.0,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    dynamic queryData = MediaQuery.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var factorHeight = 1 / 740.0 * height;
    var factorWidth = 1 / 360.0 * width;
    return Scaffold(
      floatingActionButton: Container(
        height: factorHeight * 60,
        width: factorWidth * 60,
        child: FloatingActionButton(
          backgroundColor: Colors.blue[500],
          child: Icon(
            Icons.image,
            color: Colors.black,
          ),
          onPressed: () async {
            await _getImageAndFaces();
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(factorHeight * 20.0),
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                  ),
                  child: Text(
                    'Click on the button below to see the results',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: factorHeight * 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: factorHeight * 10.0,
              ),
              Expanded(
                flex: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: factorHeight * 20,
                    vertical: factorWidth * 20,
                  ),
                  child: Column(
                    children: <Widget>[
                      _image == null
                          ? emptyImage(queryData.size.height,
                              queryData.size.width, factorHeight, factorWidth)
                          : displayPictureTask2(
                              this._image,
                              queryData.size.height,
                              queryData.size.width,
                              factorHeight,
                              factorWidth,
                            )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: factorHeight * 10.0,
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 35),
                  child: ButtonTheme(
                    height: factorHeight * 60.0,
                    minWidth: factorWidth * 250.0,
                    disabledColor: Colors.blue[100],
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(factorHeight * 10.0),
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
                          fontSize: factorHeight * 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: factorHeight * 35,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    child: Text(
                      _image == null ? 'Step 2 click button above' : "",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: factorHeight * 16.0,
                        color: Colors.blue[500],
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(bottom: factorHeight * 30),
                  child: Align(
                    child: Text(
                      _image == null
                          ? 'Step 1 click a photo from here          '
                          : '',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: factorHeight * 16.0,
                        color: Colors.blue[500],
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
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
