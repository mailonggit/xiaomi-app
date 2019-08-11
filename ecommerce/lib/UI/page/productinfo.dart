import 'package:flutter/material.dart';

class ProductInfo extends StatefulWidget {
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  var selected_product = [
    {
      'name': 'Air Dots Pro',
      'picture': 'assets/images/air-dots-pro.jpg',
      'price': 100,
      'size': 41,
      'color': 'white',
      'quantity': '1',
    },
    {
      'name': 'Air Dots',
      'picture': 'assets/images/air-dots.jpg',
      'price': 27,
      'size': 41,
      'color': 'black',
      'quantity': '1',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: selected_product.length,
      itemBuilder: (context, index) {
        return CartProduct(
          cart_name: selected_product[index]['name'],
          cart_picture: selected_product[index]['picture'],
          cart_price: selected_product[index]['price'],
          cart_size: selected_product[index]['size'],
          cart_color: selected_product[index]['color'],
          cart_quantity: selected_product[index]['quantity'],
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

  CartProduct(
      {this.cart_name,
      this.cart_picture,
      this.cart_price,
      this.cart_size,
      this.cart_color,
      this.cart_quantity});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(cart_picture),
        title: Text(
          cart_name,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
        ),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text('Size: '),
                ),
                Text(
                  cart_size.toString(),
                  style: TextStyle(color: Colors.red),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Color: '),
                ),
                Text(
                  cart_color,
                  style: TextStyle(color: Colors.red),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Quantity: '),
                ),
                Text(
                  cart_quantity,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text('Price: $cart_price\$', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: Colors.redAccent),),
            ),
          ],
        ),
      ),
    );
  }
}
