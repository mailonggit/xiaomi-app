import 'package:flutter/material.dart';

class HorizontalProduct extends StatefulWidget {
  @override
  _HorizontalProductState createState() => _HorizontalProductState();
}

class _HorizontalProductState extends State<HorizontalProduct> {
  List<String> category = ['Phone', 'TV', 'Power Bank', 'Earphone', 'Smart Devices'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: 100.0,//80 => subtitle will disappear
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 110.0,
              child: ListTile(
                title: Image.asset(
                  'assets/images/category-${index + 1}.png',
                  width: 80.0,
                  height: 80.0,
                ),
                subtitle: Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    category[index],
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ),
                onTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}