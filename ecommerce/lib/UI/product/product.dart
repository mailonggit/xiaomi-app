
import 'package:ecommerce/UI/product/horizontalproduct.dart';
import 'package:ecommerce/UI/product/recentproduct.dart';
import 'package:ecommerce/UI/product/slideproduct.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  createLabel(String label, TextStyle textStyle){
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              label,
              style: textStyle,
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

        createLabel('Category', TextStyle(color: Colors.pink, fontSize: 15.0, fontWeight: FontWeight.w700)),

        HorizontalProduct(),

        createLabel('Recent Product', TextStyle(color: Colors.pink, fontSize: 15.0, fontWeight: FontWeight.w700)),
        
        RecentProduct(),
      ],
    );
  }

  
}
