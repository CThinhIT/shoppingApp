import 'package:flutter/material.dart';
import 'package:shopping/core/ui_model/basket_item.dart';

abstract class IBasketViewModel extends ChangeNotifier {
  List<BasketItemUIModel> get basketItems;
  double get totalPrice;
  void addProduct(int productId, int quantity);
  void add(int productId);
  void remove(int productId);
  void clearProduct();
  int get countProduct;
}
