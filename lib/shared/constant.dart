import 'dart:io';
import 'package:flutter/material.dart';

const inputDecorationForm = InputDecoration(
  hintStyle: TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  ),
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
    borderSide: BorderSide(
      color: Colors.blue,
      width: 2.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
    borderSide: BorderSide(
      color: Colors.grey,
      width: 2.0,
    ),
  ),
);

Widget displayPicture(
  String slogan,
  File image,
  double height,
  double width,
  String humanCheck,
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
    height: height - (height * 0.5),
    width: width,
  );
}

Widget displayPictureTask2(File image, double height, double width) {
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
    height: height - (height * 0.5),
    width: width,
  );
}

Widget emptyImage(double height, double width) {
  return Container(
    padding: EdgeInsets.all(0.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.blue[100],
      image: DecorationImage(
        image: AssetImage('assets/noImage.png'),
        fit: BoxFit.fill,
      ),
    ),
    height: height - (height * 0.5),
    width: width,
  );
}
