import 'package:flutter/material.dart';

class Voucher {
  final String image, title;
  final int id;
  final Color color;
  final double price, discount;
  Voucher({
    required this.id,
    required this.image,
    required this.color,
    required this.price,
    required this.title,
    required this.discount,
  });
}

List<Voucher> voucher = [
  Voucher(
      id: 1,
      image: "",
      color: Colors.blue,
      price: 260.000,
      title: "Chinsu",
      discount: 120.000),
  Voucher(
      id: 2,
      image: "",
      color: Colors.red,
      price: 260.000,
      title: "Chinsu",
      discount: 120.000),
  Voucher(
      id: 3,
      image: "",
      color: Colors.yellow,
      price: 260.000,
      title: "Chinsu",
      discount: 120.000),
  Voucher(
      id: 4,
      image: "",
      color: Colors.pink,
      price: 260.000,
      title: "Chinsu",
      discount: 120.000),
];
