import 'package:flutter/material.dart';
import 'package:flutter_demo/category.dart';
import 'package:flutter_demo/home.dart';
import 'package:flutter_demo/signup.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> formKey = new GlobalKey();
  String emailPattern =
      "[^[\w]{1,}[\w.+-]{0,}@[\w-]{2,}([.][a-zA-Z]{2,}|[.][\w-]{2,}[.][a-zA-Z]{2,})]";
  late String sEmail;
  late String sPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HAWK",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                "image/logo.jpeg",
                width: 100,
                height: 100,
              ),
            ),
            Form(
                key: formKey,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Enter Email ID",
                        labelText: "Email ID",
                      ),
                      validator: (email) {
                        if (email!.isEmpty) {
                          return "Email ID Required";
                        } else if (!RegExp(email).hasMatch(email)) {
                          return "Valid Email ID";
                        }
                      },
                      onSaved: (emailValue) {
                        sEmail = emailValue!;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (password) {
                        if (password!.isEmpty) {
                          return "Password is Required ";
                        } else if (password.length < 6) {
                          return "Minimum 6 Characters are required";
                        }
                      },
                      onSaved: (passwordValue) {
                        sPassword = passwordValue!;
                      },
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 50,
                    color: Color.fromRGBO(7, 106, 225, 1),
                    
                    
                         
                       
                    child: FlatButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          print("Login Successfully \n Email Id is " +
                              sEmail +
                              "\n Password is " +
                              sPassword);
                          print("Login Successfully");
                          Fluttertoast.showToast(
                              msg: "Login Successfully",
                              toastLength: Toast.LENGTH_SHORT);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryPage()));
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 150,
                      height: 50,
                      color: Color.fromARGB(255, 233, 41, 3),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ]))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
