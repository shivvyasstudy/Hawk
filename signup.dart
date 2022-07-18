import 'package:flutter/material.dart';
import 'package:flutter_demo/home.dart';
import 'package:flutter_demo/main.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> formKey = new GlobalKey();
  String emailPattern =
      "[^[\w]{1,}[\w.+-]{0,}@[\w-]{2,}([.][a-zA-Z]{2,}|[.][\w-]{2,}[.][a-zA-Z]{2,})]";
  late String sFirstName;
  late String sLastName;
  late String sEmail;
  late String sPassword;
  late String sContactNumber;
  int radioGroupValue = 0;
  int _value = 0;
  String sCity = "Ahmedabad";

  List<String> cityArray = ["Ahmedabad", "Delhi", "Mumbai", "Pune"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up Form",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "image/user.JPG",
              width: 100,
              height: 100,
            ),
            Form(
                key: formKey,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintText: "Enter First Name",
                        labelText: "First Name",
                      ),
                      validator: (name) {
                        if (name!.isEmpty) {
                          return "First Name is Required";
                        }
                      },
                      onSaved: (firstNameValue) {
                        sFirstName = firstNameValue!;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintText: "Enter Last Name",
                        labelText: "Last Name",
                      ),
                      validator: (name) {
                        if (name!.isEmpty) {
                          return "Last Name is Required";
                        }
                      },
                      onSaved: (lastNameValue) {
                        sLastName = lastNameValue!;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextFormField(
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintText: "Enter Contact",
                        labelText: "Contact",
                      ),
                      validator: (contactNo) {
                        if (contactNo!.isEmpty) {
                          return "Password is Required ";
                        } else if (contactNo.length < 10) {
                          return "Enter 10 numbers only";
                        }
                      },
                      onSaved: (contactNoValue) {
                        sContactNumber = contactNoValue!;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
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
                    padding: const EdgeInsets.all(3.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
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
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text("Gender",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                      Radio(
                        value: 1,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = 1;
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      Text("Male"),
                      Radio(
                          value: 2,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = 2;
                            });
                          }),
                      SizedBox(width: 10),
                      Text("Female"),
                      Radio(
                          value: 3,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = 3;
                            });
                          }),
                      SizedBox(width: 10),
                      Text("Transgender"),
                    ],
                  ),
                  Row(
                    children: [
                      Text('City',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.all(.0),
                        child: DropdownButton(
                          items: cityArray.map((String cityValue) {
                            return DropdownMenuItem(
                                child: Text(cityValue), value: cityValue);
                          }).toList(),
                          onChanged: (cityValue) {
                            setState(() {
                              sCity = cityValue as String;
                              print(sCity);
                            });
                          },
                          value: sCity,
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 150,
                    height: 50,
                    color: Colors.blueAccent,
                    child: FlatButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          print("Sign Up Successfully \n First Name : " +
                              sFirstName +
                              "\n Last Name : " +
                              sLastName +
                              "\n Email Id is " +
                              sEmail +
                              "\n Password is " +
                              sPassword);
                          print("Sign Up Successfully");
                          Fluttertoast.showToast(
                              msg: "Sign Up Successfully",
                              toastLength: Toast.LENGTH_SHORT);

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MyApp()));
                        }
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ]))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
