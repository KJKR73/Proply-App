import 'dart:io';
import 'dart:math';
import 'package:ethinicty_recognition_app/shared/constant.dart';
//import 'package:camera/new/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MLTask1 extends StatefulWidget {
  @override
  _MLTask1State createState() => _MLTask1State();
}

class _MLTask1State extends State<MLTask1> {
  File _image;
  int index = 0;
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
    dynamic imageFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(imageFile.path);
      index = randIndex.nextInt(tags.length - 1);
      reset = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget messageToDisplay = Text(
      _image == null
          ? 'Your message will be displayed here'
          : tags[this.index].toString(),
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
    queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black,
                ),
                child: Text(
                  'Click on the button below to see the message',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Container(
                child: Column(children: <Widget>[
                  _image == null
                      ? emptyImage(queryData.size.height, queryData.size.width)
                      : displayPicture(tags[this.index], this._image,
                          queryData.size.height, queryData.size.width),
                ]),
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 70.0,
                child: messageToDisplay,
              ),
              ButtonTheme(
                height: 60.0,
                minWidth: 150.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: _getImage,
                  color: Colors.black,
                  child: Text(
                    'Click Here',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
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
