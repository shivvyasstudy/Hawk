import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  String sEmail;
  String sPassword;
  HomePage(this.sEmail, this.sPassword) {}
  @override
  State<HomePage> createState() => HomeState();
}

class HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Email ID",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(widget.sEmail, style: TextStyle(color: Colors.black)),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    " Password :",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(widget.sPassword, style: TextStyle(color: Colors.black)),
              ],
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
