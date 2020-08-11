import 'dart:convert';
import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  String gender;
  String race;
  String age;
  String base64Image;
  var height;
  var width;
  var factorHeight;
  var factorWidth;
  ResultDisplay({
    this.age,
    this.gender,
    this.race,
    this.base64Image,
    this.height,
    this.width,
    this.factorHeight,
    this.factorWidth,
  });

  @override
  Widget build(BuildContext context) {
    // Convert base64 to bytes //////////////////////
    var image = base64.decode(this.base64Image);
    /////////////////////////////////////////////////
    String genderDisplay = this.gender == '0' ? 'Male' : 'Female';
    dynamic _color = Colors.blue[900];
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[900],
        borderRadius: BorderRadius.circular(factorHeight * 10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: factorWidth * 2,
          vertical: factorHeight * 2,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(factorHeight * 10),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(
                    top: factorWidth * 2,
                    bottom: factorHeight * 2,
                    left: factorWidth * 2,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.memory(
                      image,
                      height: factorHeight * 200,
                      width: factorWidth * 200,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Gender : $genderDisplay',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: _color,
                        fontSize: factorHeight * 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Age : ${this.age}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: _color,
                        fontSize: factorHeight * 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Race : ${this.race}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: _color,
                        fontSize: factorHeight * 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
