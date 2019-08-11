import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final name;
  final picture;
  final new_price;
  final old_price;
  final script;
  ProductDetails(
      {this.name, this.picture, this.new_price, this.old_price, this.script});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  //custom label here
  createLabel(String label, TextStyle textStyle) {
    return Center(
        child: Text(
      label,
      style: textStyle,
    ));
  }

  //custom notification here
  //______________
  //|Notification |
  //|Message      |
  //|             |
  //|_______Button|

  createButtonAndNotification(
      String header, String message, String button, String type) {
    return Expanded(
      child: MaterialButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(header),
                  content: Text(message),
                  actions: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(button),
                    ),
                  ],
                );
              });
        },        

        //create button
        child: Row(
          children: <Widget>[
            Expanded(child: Text(type)),
            Expanded(child: Icon(Icons.arrow_drop_down)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
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
            title: createLabel('Product Details',
                TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700)),
            subtitle: Text(widget.script),
          ),
          Divider(),

          //list of button
          Row(
            children: <Widget>[
              createButtonAndNotification(
                  'Notification', 'Please Choose your size', 'Close', 'Size'),
              createButtonAndNotification(
                  'Notification', 'Please Choose your color', 'Close', 'Color'),
              createButtonAndNotification('Notification',
                  'Please Choose your quantity', 'Close', 'Quantity'),
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

          Center(
              child: createLabel('Similar Product',
                  TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700))),
          //similar product
          Container(
            height: 360.0,
            child: SimilarProduct(),
          ),
        ],
      ),
    );
  }
}

class SimilarProduct extends StatefulWidget {
  @override
  _SimilarProductState createState() => _SimilarProductState();
}

class _SimilarProductState extends State<SimilarProduct> {
  var product_list = [
    {
      'name': 'Air Dots Pro',
      'picture': 'assets/images/air-dots-pro.jpg',
      'old_price': 100,
      'new_price': 82,
      'script':
          'Dubbed AirDots Pro, the new earbuds come with designs nearly identical to the AirPods, including a Bluetooth-friendly carrying case that doubles as a charger to keep the AirDots charged. The AirDots themselves have a white finish and connect wirelessly to your phone. According to MacRumors, which earlier reported on the AirDots Pro, they come with four hours of battery life out of the box, and the case adds another 10 hours of charge.',
    },
    {
      'name': 'Smart Home',
      'picture': 'assets/images/smart-home.jpg',
      'old_price': 200,
      'new_price': 140,
      'script':
          'This binding allows your openHAB to communicate with the Xiaomi Smart Home Suite. It consists of devices communicating over a ZigBee network with a ZigBee - WiFi gateway.The devices are very affordable and you can get them from your favourite chinese marktes like AliExpress or GearBest. The sensors run on a coincell battery for over a year.After setup, you can disconnect the gateway from the internet to keep your sensor information private.# Supported devices',
    },
    {
      'name': 'Air Dots',
      'picture': 'assets/images/air-dots.jpg',
      'old_price': 70,
      'new_price': 50,
      'script':
          'Redmi AirDots Wireless Earbuds is designed with Bluetooth 5.0 support. It is packed with a built-in Realtek 8763 chip and can be used for bilateral calls and digital sound quality is assured with its DSP digital noise reduction.',
    },
    {
      'name': 'Mi Wireless',
      'picture': 'assets/images/mouse-wireless.jpg',
      'old_price': 45,
      'new_price': 27,
      'script':
          'The design of the mouse is directly related to the comfort of your grip. Mi Wireless Mouse has a classic shape that is designed to maximize alignment with the contours of your hand. The design of the case is made in the shape of the palm to provide maximum convenience.',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250.0,
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(product_list.length, (index) {
            return SimilarSingleProduct(
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

class SimilarSingleProduct extends StatelessWidget {
  final name, script;
  final picture;
  final old_price, new_price;

  SimilarSingleProduct(
      {this.name, this.picture, this.old_price, this.new_price, this.script});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: name,
        child: Material(
          child: InkWell(
            onTap: () {
              //passing value to product details page
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetails(
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
