import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
class SlideProduct extends StatefulWidget {
  @override
  _SlideProductState createState() => _SlideProductState();
}

class _SlideProductState extends State<SlideProduct> {
  @override
  Widget build(BuildContext context) {
   return Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.fitHeight,
        images: [
          AssetImage('assets/images/product-1.jpg'),
          AssetImage('assets/images/product-2.jpg'),
          AssetImage('assets/images/product-3.jpg'),
          AssetImage('assets/images/product-4.jpg'),
          AssetImage('assets/images/product-5.jpg'),
        ],
        dotSize: 5.0,
        dotSpacing: 10.0,
        indicatorBgPadding: 5.0,
        autoplayDuration: Duration(milliseconds: 2000),
        dotColor: Colors.red,
        borderRadius: true,
      ),
    );
  }
}
