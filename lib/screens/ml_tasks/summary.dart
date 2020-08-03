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
        backgroundColor: Colors.black,
        title: Text('Summary'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text('Summary'),
            Expanded(
              child: Text('dsd'),
            )
          ],
        ),
      ),
    );
  }
}
