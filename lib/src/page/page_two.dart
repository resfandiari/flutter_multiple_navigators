import 'package:flutter/material.dart';

import 'index.dart';

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Two"),
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
            builder: (context) => new PageDetail(message: "From Page Two")));
  }
}
