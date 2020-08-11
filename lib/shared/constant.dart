import 'dart:io';
import 'package:flutter/material.dart';

InputDecoration inputDecorationForm(var factor) {
  return InputDecoration(
    hintStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    fillColor: Colors.black,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(factor * 8.0),
      ),
      borderSide: BorderSide(
        color: Colors.blue,
        width: factor * 2.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(factor * 8.0),
      ),
      borderSide: BorderSide(
        color: Colors.grey,
        width: factor * 2.0,
      ),
    ),
  );
}

Widget displayPicture(
  String slogan,
  File image,
  double height,
  double width,
  String humanCheck,
  var factorHeight,
  var factorWidth,
) {
  return Container(
    padding: EdgeInsets.only(bottom: 4.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.blue,
      image: DecorationImage(
        image: humanCheck == "0"
            ? AssetImage('assets/humanCheck.jpg')
            : FileImage(image),
        fit: BoxFit.cover,
      ),
    ),
    height: factorHeight * 350 - 1,
    width: factorWidth * width,
  );
}

Widget displayPictureTask2(
  File image,
  double height,
  double width,
  var factorHeight,
  var factorWidth,
) {
  return Container(
    padding: EdgeInsets.only(bottom: 4.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      image: DecorationImage(
        image: FileImage(image),
        fit: BoxFit.cover,
      ),
    ),
    height: factorHeight * 350 - 1,
    width: factorWidth * width,
  );
}

Widget emptyImage(
  double height,
  double width,
  var factorHeight,
  var factorWidth,
) {
  return Container(
    padding: EdgeInsets.all(0.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.blue[100],
      image: DecorationImage(
        image: AssetImage('assets/noImage.png'),
        fit: BoxFit.cover,
      ),
    ),
    height: factorHeight * 350 - 1,
    width: factorWidth * width,
  );
}
