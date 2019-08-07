import 'package:flutter/material.dart';

class RecentProduct extends StatefulWidget {
  @override
  _RecentProductState createState() => _RecentProductState();
}

class _RecentProductState extends State<RecentProduct> {
  var product_list = [
    {
      'name' : 'Air Dots Pro',
      'picture' :'assets/images/air-dots-pro.jpg',
      'old_price': 100,
      'new_price': 82,
    },
    {
      'name' : 'Smart Home',
      'picture' :'assets/images/smart-home.jpg',
      'old_price': 200,
      'new_price': 140,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.0,
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(product_list.length, (index) {
            return SingleProduct(
              name: product_list[index]['name'],
              picture: product_list[index]['picture'],
              old_price: product_list[index]['old_price'],
              new_price: product_list[index]['new_price'],
            );
          }),
        ));
  }
}

class SingleProduct extends StatelessWidget {
  final name;
  final picture;
  final old_price, new_price;

  SingleProduct({this.name, this.picture, this.old_price, this.new_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: name,
        child: Material(
          child: InkWell(
            child: GridTile(
              child: Image.asset(picture, fit: BoxFit.cover,),
              
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(name),
                ),
              ),
              
            ),
          ),
        ),
      ),
    );
  }
}
