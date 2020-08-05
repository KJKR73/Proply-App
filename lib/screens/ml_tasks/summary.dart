import 'package:ethinicty_recognition_app/customs/result_display.dart';
import 'package:flutter/material.dart';

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
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 1.0,
                    color: Colors.white,
                  );
                },
                itemCount: data['face_data'].length,
                itemBuilder: (context, index) {
                  return new ResultDisplay(
                    age: data['face_data'][index]['age'].toString(),
                    gender: data['face_data'][index]['gender'].toString(),
                    race: data['face_data'][index]['gender'].toString(),
                    base64Image: data['face_data'][index]['base64'],
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
