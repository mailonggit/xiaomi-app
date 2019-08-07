import 'package:ecommerce/UI/horizontalproduct.dart';
import 'package:ecommerce/UI/recentproduct.dart';
import 'package:ecommerce/UI/slideproduct.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  categoryLabel(){
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              'Category',
              style: TextStyle(fontSize: 15.0),
              textScaleFactor: 1.2,
            ),
          ),
        );
  }
  recentProductLabel() {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              'Recent Product',
              style: TextStyle(fontSize: 15.0),
              textScaleFactor: 1.2,
            ),
          ),
        );
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[        

        SlideProduct(),

        categoryLabel(),

        HorizontalProduct(),

        recentProductLabel(),
        
        RecentProduct(),
      ],
    );
  }

  
}
