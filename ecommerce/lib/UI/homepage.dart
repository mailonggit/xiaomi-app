import 'package:ecommerce/UI/product/product.dart';
import 'package:ecommerce/UI/shoppingcart/cartpage.dart';
import 'package:flutter/material.dart';

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
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
            },
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
              title: Text('HomePage'),            
              leading: Icon(Icons.home),
            ),
           ListTile(
              title: Text('My Acount'),            
              leading: Icon(Icons.person),
            ),
            ListTile(
              title: Text('My Orders'),            
              leading: Icon(Icons.shopping_basket),
            ),
            ListTile(
              title: Text('Shopping Carts'),            
              leading: Icon(Icons.shopping_cart),
            ),
            ListTile(
              title: Text('Favorites'),            
              leading: Icon(Icons.favorite),
            ),
            Divider(),
            ListTile(
              title: Text('Settings'),            
              leading: Icon(Icons.settings),
            ),
            ListTile(
              title: Text('About'),            
              leading: Icon(Icons.help),
            ),
          ],
        ),
      ),
      body: ProductPage(),      
    );
  }
}
