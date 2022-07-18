import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductDetailPage extends StatefulWidget {
  String productName, productPrice, productImage, productDescription;

  ProductDetailPage(this.productName, this.productPrice, this.productImage,
      this.productDescription) {}

  @override
  State<ProductDetailPage> createState() => ProductDetailState();
}

class ProductDetailState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.productName,
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: <Widget>[
          Image.asset(
            widget.productImage,
            width: 200,
            height: 200,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "Product Name",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                widget.productName,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Price",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                widget.productPrice,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Description",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                widget.productDescription,
                style: TextStyle(color: Colors.black),
              ),
            ],
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
