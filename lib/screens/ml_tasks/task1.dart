import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:ethinicty_recognition_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class MLTask1 extends StatefulWidget {
  @override
  _MLTask1State createState() => _MLTask1State();
}

class _MLTask1State extends State<MLTask1> {
  File _image;
  int index;
  String _humanCheck = "0";
  String sloganToDisplay = '';
  bool reset = false;
  MediaQueryData queryData;
  List<String> tags = [
    "You're a great listener.",
    "How is it that you always look great, even in sweatpants?",
    "Everything would be better if more people were like you!",
    "I bet you sweat glitter.",
    "That color is perfect on you.",
    "You may dance like no one's watching, but everyone's watching because you're an amazing dancer!",
    "Being around you makes everything better!",
    "When you're not afraid to be yourself is when you're most incredible.",
    "Colors seem brighter when you're around.",
    "You're more fun than a ball pit filled with candy. (And seriously, what could be more fun than that?)",
    "That thing you don't like about yourself is what makes you so interesting.",
    "You're wonderful.",
    "You have cute elbows. For reals!",
    "Jokes are funnier when you tell them.",
    "You're better than a triple-scoop ice cream cone. With sprinkles.",
    "When I'm down you always say something encouraging to help me feel better.",
    "You're one of a kind!",
    "You help me be the best version of myself.",
    "If you were a box of crayons, you'd be the giant name-brand one with the built-in sharpener.",
    "You should be thanked more often. So thank you!!",
    "Our community is better because you're in it.",
    "Someone is getting through something hard right now because you've got their back. ",
    "You have the best ideas.",
    "You always find something special in the most ordinary things."
  ];

  var randIndex = new Random();
  final picker = ImagePicker();
  Future _getImage() async {
    dynamic imageFile = await picker.getImage(
      source: ImageSource.camera,
      maxHeight: 500,
      maxWidth: 500,
    );
    final imageBytes = File(imageFile.path).readAsBytesSync();
    String base64Image = base64Encode(imageBytes);
    /////////////////////////////////////////////////
    var url = 'http://52.66.206.153:8080/humancheck';
    Map data = {
      'query': base64Image,
    };
    var body = json.encode(data);
    var response = await post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    // Manuplate the response to get the predictions
    Map faceData = json.decode(response.body);

    if (response.statusCode != 200) {
      print('Some Error at the backend occured please check you code again');
    }

    setState(() {
      _humanCheck = faceData['response'].toString();
      _image = File(imageFile.path);
      index = randIndex.nextInt(tags.length - 1);
      reset = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var factorHeight = 1 / 740.0 * height;
    var factorWidth = 1 / 360.0 * width;
    Widget messageToDisplay = Text(
      (_image == null) || (_humanCheck == "0")
          ? 'Your message will be displayed here'
          : tags[this.index].toString(),
      style: TextStyle(
        color: Colors.blue[900],
        fontSize: factorHeight * 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
    queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(
                    factorHeight * 20.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                  ),
                  child: Text(
                    'Click on the button below to see the message',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: factorHeight * 24.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: factorHeight * 10.0),
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
                          ? emptyImage(
                              queryData.size.height,
                              queryData.size.width,
                              factorHeight,
                              factorWidth,
                            )
                          : displayPicture(
                              tags[this.index],
                              this._image,
                              queryData.size.height,
                              queryData.size.width,
                              _humanCheck),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: factorHeight * 10.0,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: (_humanCheck == "0") && (_image == null)
                      ? messageToDisplay
                      : Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: factorWidth * 20,
                            vertical: 0,
                          ),
                          child: Text(
                            'Man you dumbass bitch you think you can fool me',
                            style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: factorHeight * 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: factorHeight * 20,
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: factorHeight * 50,
                  ),
                  child: ButtonTheme(
                    height: factorHeight * 60.0,
                    minWidth: factorWidth * 250.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          factorHeight * 10.0,
                        ),
                      ),
                      onPressed: _getImage,
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
            ],
          ),
        ),
      ),
    );
  }
}
