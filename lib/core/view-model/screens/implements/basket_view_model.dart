import 'package:flutter/material.dart';
import 'package:shopping/core/ui_model/basket_item.dart';
import 'package:shopping/core/ui_model/product.dart';
import 'package:shopping/core/view-model/screens/interfaces/ibasket_view_model.dart';

class BasketViewModel extends ChangeNotifier implements IBasketViewModel {
  // final List<Product> products = Product.products.toList(growable: true);
  final List<BasketItemUIModel> _basketItems = [];

  @override
  List<BasketItemUIModel> get basketItems => _basketItems;
  int _countProduct = 0;
  double _totalPrice = 0;
  @override
  double get totalPrice => _totalPrice;

  @override
  void addProduct(int productId, int quantity) {
    if (_basketItems.any((element) => element.product.id == productId)) {
      _basketItems
          .firstWhere((element) => element.product.id == productId)
          .quantity = quantity;
    } else {
      var product = products.firstWhere((element) => element.id == productId);
      _basketItems.add(BasketItemUIModel(
          product: product, quantity: quantity, id: product.id));
    }
    notifyListeners();
  }

  @override
  void add(int productId) {
    if (_basketItems.any((element) => element.product.id == productId)) {
      _basketItems
          .firstWhere((element) => element.product.id == productId)
          .quantity++;
    } else {
      var product = products.firstWhere((element) => element.id == productId);
      _basketItems.add(
          BasketItemUIModel(product: product, quantity: 1, id: product.id));
    }
    notifyListeners();
  }

  @override
  void remove(int productId) {
    if (_basketItems.any((element) => element.product.id == productId)) {
      if (_basketItems
              .firstWhere((element) => element.product.id == productId)
              .quantity >
          1) {
        _basketItems
            .firstWhere((element) => element.product.id == productId)
            .quantity--;
      }
    }
    notifyListeners();
  }

  void removeProduct(int productId) {
    var product = products.firstWhere((element) => element.id == productId);
    _basketItems.remove(
        BasketItemUIModel(product: product, quantity: 0, id: product.id));

    notifyListeners();
  }

  @override
  void clearProduct() {
    _basketItems.clear();
    notifyListeners();
  }

  double getSumPriceProduct(int productId) {
    if (_basketItems.any((element) => element.product.id == productId)) {
      return _basketItems
              .firstWhere((element) => element.product.id == productId)
              .quantity *
          _basketItems
              .firstWhere((element) => element.product.id == productId)
              .product
              .price;
    }
    return 0;
  }

  double getSumPriceTotal() {
    double total = 0;
    for (int i = 0; i < basketItems.length; i++) {
      total += getSumPriceProduct(basketItems[i].id);
    }
    return total;
  }

  // bool activeProduct(String productId) {
  //   if (_basketItems.any((element) => element.product.id == productId)) {
  //     if (getQuantity(productId) > 0) {
  //       return false;
  //     }
  //   }
  //   return true;
  // }

  void buyProduct() {
    _totalPrice = 0;
  }

  void deleteProduct(int productId) {
    if (_basketItems.any((element) => element.product.id == productId)) {
      var product = products.firstWhere((element) => element.id == productId);
      _basketItems.remove(
          BasketItemUIModel(product: product, quantity: 0, id: product.id));
    }
    notifyListeners();
  }

  @override
  int get countProduct => _countProduct;

  int countItem() {
    _countProduct = basketItems.length;
    return _countProduct;
  }
}
