import 'package:ecommerce/UI/product.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Product'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.green,
        elevation: 2.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Mai Hoang Long'),
              accountEmail: Text('mailonggit@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    child: Image.asset(
                      'assets/images/avatar.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              subtitle: Text('Back to homepage screen'),
              leading: Icon(Icons.home),
            ),
            ListTile(
              title: Text('Shopping Cart'),
              subtitle: Text('See what product you choose to buy'),
              leading: Icon(Icons.shopping_cart),
            ),
            Divider(),
          ],
        ),
      ),
      body: ProductPage(),      
    );
  }
}
