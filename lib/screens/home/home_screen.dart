import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/contants.dart';
import 'package:shopping/screens/cart/cartScreen.dart';
import 'package:shopping/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 98, 90, 90),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
            ),
            SizedBox(width: kDefaultPaddin / 2)
          ],
        ),
        body: Body());
  }
}
