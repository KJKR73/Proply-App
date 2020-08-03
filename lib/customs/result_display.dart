import 'dart:convert';
import 'dart:typed_data';
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
    List<int> bytes = utf8.encode(this.base64Image);
    String image = base64Encode(bytes);
    Uint8List finalImage = base64Decode(image);
    /////////////////////////////////////////////////
    return Container(
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: MemoryImage(finalImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text('${this.gender}'),
              Text('${this.age}'),
              Text('${this.race}'),
            ],
          ),
        ),
      ),
    );
  }
}
