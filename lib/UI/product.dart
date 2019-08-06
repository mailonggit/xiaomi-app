import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<String> category = ['Phone', 'TV', 'Power Bank', 'Earphone', 'Smart Devices'];
  slideProduct() {
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

  productCategory(String title, String sub) {
    return Container(
      width: 100.0,
      child: ListTile(
        title: Image.asset(
          title,
          width: 100.0,
          height: 80.0,
        ),
        subtitle: Container(
            alignment: Alignment.topCenter,
            child: Text(
              sub,
              style: TextStyle(
                fontSize: 12.0,
              ),
            )),
        onTap: () {},
      ),
    );
  }

  //return productCategory('assests/images/category-${index + 1}.png', category[index]);
  horizontalProduct() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: 100.0,//80 => subtitle will disappear
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 110.0,
              child: ListTile(
                title: Image.asset(
                  'assets/images/category-${index + 1}.png',
                  width: 100.0,
                  height: 80.0,
                ),
                subtitle: Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    category[index],
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ),
                onTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        //carousel
        slideProduct(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              'Category',
              style: TextStyle(fontSize: 15.0),
              textScaleFactor: 1.2,
            ),
          ),
        ),
        horizontalProduct(),
      ],
    );
  }
}
