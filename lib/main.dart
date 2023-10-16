import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> users = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final response = await Dio().get('https://dummyjson.com/users');
      if (response.statusCode == 200) {
        setState(() {
          users = List<Map<String, dynamic>>.from(response.data['users']);
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 242, 242, 245),
        appBar: AppBar(
          title: Text('API Data with Dio'),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.only(left: 12, right: 12, bottom: 8, top: 5),
              color: Colors.white,
              elevation: 0,
              child: ClipRRect(
                child: ListTile(
                  leading:
                      ClipRRect(child: Image.network(users[index]['image'])),
                  title: Text(
                    users[index]['firstName'],
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(users[index]['age'].toString()),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
