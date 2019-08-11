import 'package:ecommerce/UI/page/cartpage.dart';
import 'package:ecommerce/UI/product/product.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //Custom button from drawer widget
  featureButton(String feature_name, Icon icon_name) {
    return ListTile(
      title: Text(
        feature_name,
      ),
      leading: icon_name,
      onTap: (){},
    );
  }

  headerAccount() {
    return UserAccountsDrawerHeader(
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
    );
  }

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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
          ),
        ],
        backgroundColor: Colors.orange,
        elevation: 3.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[

            headerAccount(),

            featureButton('HomePage',Icon(Icons.home,color: Colors.red,)),
                
            featureButton('My Account', Icon(Icons.person, color: Colors.red)),

            featureButton('My Orders', Icon(Icons.shopping_basket, color: Colors.red)),

            featureButton('View Cart', Icon(Icons.shopping_cart, color: Colors.red)),

            featureButton('Favorites', Icon(Icons.favorite, color: Colors.red)),

            featureButton('View Cart', Icon(Icons.shopping_cart, color: Colors.red)),

            Divider(),

            featureButton('Settings', Icon(Icons.settings, color: Colors.grey)),

            featureButton('About', Icon(Icons.help, color: Colors.blue)),

          ],
        ),
      ),
      body: ProductPage(),
    );
  }
}
