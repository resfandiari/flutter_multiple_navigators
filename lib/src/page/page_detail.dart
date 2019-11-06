import 'package:flutter/material.dart';

class PageDetail extends StatelessWidget {
  final String message;

  PageDetail({key,this.message}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Detail"),
      ),
      body: Container(
        child: Center(
          child: Text(message),
        ),
      ),
    );
  }

}
