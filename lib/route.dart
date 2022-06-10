import 'package:flutter/widgets.dart';
import 'package:shopping/screens/cart/cartScreen.dart';
import 'package:shopping/screens/home/home_screen.dart';
import 'package:shopping/screens/test/test_screen.dart';

final Map<String, WidgetBuilder> routes = {
  TestScreen.routeName:(context) => TestScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  CartScreen.routeName: (context) => CartScreen(),
};
