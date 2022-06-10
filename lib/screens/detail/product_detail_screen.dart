import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/core/ui_model/product.dart';
import 'package:shopping/screens/detail/components/body.dart';

import '../cart/cartScreen.dart';

class DetailScreen extends StatelessWidget {
  final Product product;
  const DetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Body(
        product: product,
      ),
    );
  }
}
