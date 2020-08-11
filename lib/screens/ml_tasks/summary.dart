import 'package:ethinicty_recognition_app/customs/result_display.dart';
import 'package:flutter/material.dart';
import 'dart:math';

// This will show the summary of all the faces that were detected
class Summary extends StatefulWidget {
  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var factorHeight = 1 / 740.0 * height;
    var factorWidth = 1 / 360.0 * width;
    var rng = new Random();
    List others = ['Hispanic', 'Latino', 'Middle Eastern'];
    Map raceDict = {
      '0': 'White',
      '1': 'Black',
      '2': 'Asian',
      '3': 'Indian',
      '4': others[rng.nextInt(others.length - 1)]
    };
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.blue[900],
        title: Text(
          'Summary',
          style: TextStyle(
            color: Colors.white,
            fontSize: factorHeight * 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(
          factorWidth * 5,
          factorHeight * 10,
          factorWidth * 5,
          factorHeight * 0,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    height: factorHeight * 1.0,
                    color: Colors.white,
                  );
                },
                itemCount: data['face_data'].length,
                itemBuilder: (context, index) {
                  return new ResultDisplay(
                    age: data['face_data'][index]['age'].toString(),
                    gender: data['face_data'][index]['gender'].toString(),
                    race:
                        raceDict[data['face_data'][index]['gender'].toString()],
                    base64Image: data['face_data'][index]['base64'],
                    height: height,
                    width: width,
                    factorHeight: factorHeight,
                    factorWidth: factorWidth,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
