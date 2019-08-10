import 'package:ecommerce/UI/product/productdetails.dart';
import 'package:flutter/material.dart';

class RecentProduct extends StatefulWidget {
  @override
  _RecentProductState createState() => _RecentProductState();
}

class _RecentProductState extends State<RecentProduct> {
  var product_list = [
    {
      'name': 'Air Dots Pro',
      'picture': 'assets/images/air-dots-pro.jpg',
      'old_price': 100,
      'new_price': 82,
      'script' : 'Dubbed AirDots Pro, the new earbuds come with designs nearly identical to the AirPods, including a Bluetooth-friendly carrying case that doubles as a charger to keep the AirDots charged. The AirDots themselves have a white finish and connect wirelessly to your phone. According to MacRumors, which earlier reported on the AirDots Pro, they come with four hours of battery life out of the box, and the case adds another 10 hours of charge.',
    },
    {
      'name': 'Smart Home',
      'picture': 'assets/images/smart-home.jpg',
      'old_price': 200,
      'new_price': 140,
      'script' : 'This binding allows your openHAB to communicate with the Xiaomi Smart Home Suite. It consists of devices communicating over a ZigBee network with a ZigBee - WiFi gateway.The devices are very affordable and you can get them from your favourite chinese marktes like AliExpress or GearBest. The sensors run on a coincell battery for over a year.After setup, you can disconnect the gateway from the internet to keep your sensor information private.# Supported devices',
    },
     {
      'name': 'Air Dots',
      'picture': 'assets/images/air-dots.jpg',
      'old_price': 70,
      'new_price': 50,
      'script' : 'Redmi AirDots Wireless Earbuds is designed with Bluetooth 5.0 support. It is packed with a built-in Realtek 8763 chip and can be used for bilateral calls and digital sound quality is assured with its DSP digital noise reduction.',
    },
     {
      'name': 'Mi Wireless',
      'picture': 'assets/images/mouse-wireless.jpg',
      'old_price': 45,
      'new_price': 27,
      'script' : 'The design of the mouse is directly related to the comfort of your grip. Mi Wireless Mouse has a classic shape that is designed to maximize alignment with the contours of your hand. The design of the case is made in the shape of the palm to provide maximum convenience.',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250.0,
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(product_list.length, (index) {
            return SingleProduct(
              name: product_list[index]['name'],
              picture: product_list[index]['picture'],
              old_price: product_list[index]['old_price'],
              new_price: product_list[index]['new_price'],
              script: product_list[index]['script'],
            );
          }),
        ));
  }
}

class SingleProduct extends StatelessWidget {
  final name, script;
  final picture;
  final old_price, new_price;

  SingleProduct({this.name, this.picture, this.old_price, this.new_price, this.script});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: name,
        child: Material(
          child: InkWell(
            onTap: (){
              //passing value to product details page
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetails(
                name: name,
                picture: picture,
                new_price: new_price,
                old_price: old_price, 
                script: script,             
              )));
            },
            child: GridTile(              
              child: Image.asset(
                picture,
                fit: BoxFit.cover,                
              ),
              footer: Container(
                height: 70.0,
                color: Colors.white70,
                child: ListTile(
                  leading: Text(name),
                  title: Text(
                    '${new_price.toString()}\$',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  subtitle: Text(
                    '${old_price.toString()}\$',
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
