import 'package:shopping/core/ui_model/product.dart';

class BasketItemUIModel {
  Product product;
  int quantity;
  int id;
  BasketItemUIModel({
    required this.id,
    required this.product,
    required this.quantity,
  });
}
