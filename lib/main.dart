import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 150),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Hello World',
                style: TextStyle(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
