import 'package:ecommerce/UI/shoppingcart/productinfo.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Orders'),
        elevation: 2.0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
            color: Colors.white,
          )
        ],
        backgroundColor: Colors.green,
      ),
      
      body: ProductInfo(),

      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text('Total'),
                subtitle: Text('130\$'),
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: () {},
                child: Text('Check Out'),
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),      
    );
  }
}
