import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final name;
  final picture;
  final new_price;
  final old_price;

  ProductDetails({this.name, this.picture, this.new_price, this.old_price});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yeah'),
        centerTitle: true,
        elevation: 2.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          
          
          Container(
            height: 300.0,
            color: Colors.white,
            child: GridTile(
              //picture
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.picture),
              ),
              //name of product
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    widget.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                    ),
                  ),
                  //old_price and new_price
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: Text(
                            widget.old_price.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            widget.new_price.toString(),
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('Product Details'),
            subtitle: Text('This binding allows your openHAB to communicate with the Xiaomi Smart Home Suite. It consists of devices communicating over a ZigBee network with a ZigBee - WiFi gateway.The devices are very affordable and you can get them from your favourite chinese marktes like AliExpress or GearBest. The sensors run on a coincell battery for over a year.After setup, you can disconnect the gateway from the internet to keep your sensor information private.# Supported devices'),
            
          ),
          Divider(),
          
          //list of button          
          Row(
            children: <Widget>[
              //size button
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text('Notification'),
                          content: Text('Please choose your size'),
                          actions: <Widget>[
                            MaterialButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text('Close'),
                            ),
                          ],                 
                        );
                      }
                    );
                  },
                  textColor: Colors.black,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text('Size')),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              //Color button
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text('Notification'),
                          content: Text('Please choose your color'),
                          actions: <Widget>[
                            MaterialButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text('Close'),
                            ),
                          ],                 
                        );
                      }
                    );
                  },
                  textColor: Colors.black,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text('Color')),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              //Qty button
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text('Notification'),
                          content: Text('Please choose your Qty'),
                          actions: <Widget>[
                            MaterialButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text('Close'),
                            ),
                          ],                 
                        );
                      }
                    );
                  },
                  textColor: Colors.black,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text('Qty')),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          //purchase, add to cart and favorite button
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  child: Text('Purchase'),
                ),
              ),
              IconButton(
                icon: Icon(Icons.add_shopping_cart),
                color: Colors.red,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.favorite),
                color: Colors.red,
                onPressed: () {},
              ),
            ],
          ),
           
          Divider(),
          
        ],
      ),
    );
  }
}
