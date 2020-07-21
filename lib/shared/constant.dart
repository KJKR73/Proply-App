import 'dart:io';
import 'package:flutter/material.dart';

const inputDecorationForm = InputDecoration(
  hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  fillColor: Colors.black,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
    borderSide: BorderSide(color: Colors.red, width: 2.0),
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

Widget displayPicture(String slogan, File image, double height, double width) {
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
    height: height - (height * 0.6),
    width: width,
  );
}

Widget emptyImage(double height, double width) {
  return Container(
    padding: EdgeInsets.all(0.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.black,
      image: DecorationImage(
        image: AssetImage('assets/no_image.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    height: height - (height * 0.6),
    width: width,
  );
}
