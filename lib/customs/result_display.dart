import 'dart:convert';
import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  String gender;
  String race;
  String age;
  String base64Image;
  ResultDisplay({
    this.age,
    this.gender,
    this.race,
    this.base64Image,
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
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(3),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.memory(
                    image,
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Gender : $genderDisplay',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: _color,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Age : ${this.age}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: _color,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Race : ${this.race}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: _color,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
