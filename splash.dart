import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_demo/main.dart';

class SplashApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    doSplash();
  }

  Future<Timer> doSplash() async {
    return new Timer(Duration(seconds: 4), afterLoading);
  }

  afterLoading() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 106, 225, 100),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/logo.jpeg',
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
