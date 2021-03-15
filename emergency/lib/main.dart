import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as URLLauncher;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(247, 82, 50, 1),
          title: Text(
            'Emergency App',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        backgroundColor: Color.fromRGBO(45, 48, 45, 0.8),
        body: Center(
          child: Ink(
            height: 300,
            width: 300,
            color: Color.fromRGBO(61, 48, 40, 1),
            child: InkWell(
              onTap: () async {
                var url;
                if (Platform.isAndroid) {
                  url = 'sms:+919348188616?body=HELP';
                  await URLLauncher.launch(url);
                } else if (Platform.isIOS) {
                  url = 'sms:+919348188616&body=HELP';
                }
              },
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Center(
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(61, 48, 40, 1),
                          shape: BoxShape.circle),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 253,
                      width: 253,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(123, 61, 45, 1),
                          shape: BoxShape.circle),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 204,
                      width: 204,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(201, 74, 49, 1),
                          shape: BoxShape.circle),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 149,
                      width: 149,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(247, 82, 50, 1),
                          shape: BoxShape.circle),
                    ),
                  ),
                  Center(
                      child: Container(
                          height: 50,
                          width: 50,
                          child: Image.asset('assets/alert.png')))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
