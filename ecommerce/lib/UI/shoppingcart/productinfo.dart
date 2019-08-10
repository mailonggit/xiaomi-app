import 'package:flutter/material.dart';

class ProductInfo extends StatefulWidget {
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  var selected_product = [
    {
      'name' : 'long',
      'picture' : 'assets',
      'price' : 100,
      'size': 41,
      'color': 'red',
      'quantity': '1',
    },

  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: selected_product.length,
      itemBuilder: (context, index){
        return CartProduct(
          cart_name: selected_product[index]['name'],
          cart_picture: selected_product[index]['picture'],
          cart_price: selected_product[index]['price'],
          cart_size: selected_product[index]['size'],
          cart_color: selected_product[index]['color'],
          cart_quantity: selected_product[index]['quatity'],

        );
      },
    );
  }
}

class CartProduct extends StatelessWidget {
  final cart_name;
  final cart_picture;
  final cart_price;
  final cart_size;
  final cart_color;
  final cart_quantity;
  
  CartProduct({this.cart_name, this.cart_picture, this.cart_price, this.cart_size, this.cart_color, this.cart_quantity});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(cart_name),
      ),
    );
  }
}