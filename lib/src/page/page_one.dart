import 'package:flutter/material.dart';

import 'index.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page One"),
      ),
      body: Container(
        child: Center(
          child: MaterialButton(
              child: Text(
                "Open Detail",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => _buttonTapped(),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              color: Colors.redAccent,
              elevation: 2,
              highlightElevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
        ),
      ),
    );
  }

  _buttonTapped() {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new PageDetail(message: "From Page One")));
  }
}
