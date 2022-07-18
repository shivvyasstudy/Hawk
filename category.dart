import 'package:flutter/material.dart';
import 'package:flutter_demo/product.dart';
import 'package:fluttertoast/fluttertoast.dart';

List<String> categoryNameArray = ["Fruits", "Vegetable"];
List<String> categoryImageArray = ["image/fruit.jpeg", "image/veg.jpeg"];

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Category'),
        ),
        body: Container(
          child: CustomListCard(),
        ),
      ),
    );
  }
}

class CustomListCard extends StatelessWidget {
  GlobalKey<FormState> formKey = new GlobalKey();

  late String sEmail;
  late String sPassword;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: categoryNameArray.length,
        itemBuilder: (context, position) {

           return GestureDetector(
            onTap: () {
              Fluttertoast.showToast(
                  msg: categoryNameArray[position],
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  toastLength: Toast.LENGTH_SHORT);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProductPage()));
            },
            child: Card(
            
            elevation: 5,
            child: Row(
              children: [
              Image.asset(
                categoryImageArray[position],
                width: 100,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  categoryNameArray[position],
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          )
          );
         
          
        });
  }
}
