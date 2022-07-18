import 'package:flutter/material.dart';
import 'package:flutter_demo/prodcutDetail.dart';
import 'package:fluttertoast/fluttertoast.dart';

List<String> productNameArray = ["Apple", "Banana", "Grapes", "Chilli"];
List<String> productImageArray = [
  "image/Apple.jpeg",
  "image/Banana.jpeg",
  "image/Grapes.jpeg",
  "image/Chilli.jpeg"
];
List<String> productPriceArray = ["200", "100", "50", "10"];
List<String> productDetailArray = [
  "apple, (Malus domestica), fruit of the domesticated tree Malus domestica (family Rosaceae), one of the most widely cultivated tree fruits.",
  "The fruit is variable in size, color, and firmness, but is usually elongated and curved, with soft flesh rich in starch covered with a rind, which may be green, yellow, red, purple, or brown when ripe.",
  "Description. Grapes are a type of fruit that grow in clusters of 15 to 300, and can be crimson, black, dark blue, yellow, green, orange, and pink.",
  "Chilli is a fruit which belongs to Capsicum genus. It has many varieties which are differentiated on its pungency measured on Scoville Scale. Chilli fruit when ripened and dried becomes red chilli, which is further grounded to form red chilli powder. These are categorized as hot pepper."
];

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product'),
        ),
        body: Container(
          child: CustomListCard(),
        ),
      ),
    );
  }
}

class CustomListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: productNameArray.length,
        itemBuilder: (context, position) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                          productNameArray[position],
                          productPriceArray[position],
                          productImageArray[position],
                          productDetailArray[position])));
            },
            child: Card(
              elevation: 5,
              child: Row(children: [
                Image.asset(
                  productImageArray[position],
                  width: 100,
                  height: 100,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        productNameArray[position],
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "₹${productPriceArray[position]}",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          );
        });
  }
}
