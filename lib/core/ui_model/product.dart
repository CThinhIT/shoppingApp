import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int size, id, check;
  final Color color;
  final double price;

  static var products;
  Product({
    required this.id,
    required this.image,
    required this.color,
    required this.description,
    required this.price,
    required this.size,
    required this.title,
    required this.check,
  });
}

class ProductGroup {
  final int id;
  final String name;
  final List<Product> products;
  ProductGroup({
    required this.id,
    required this.name,
    required this.products,
  });
}

List<ProductGroup> productGroups = [
  ProductGroup(
    id: 0,
    name: "Hand bag",
    products: [
      Product(
          id: 1,
          title: "Office Code",
          price: 234.01,
          size: 12,
          description: dummyText,
          image: "assets/images/bag_1.png",
          color: Color(0xFF3D82AE),
          check: 0),
      Product(
          id: 2,
          title: "Belt Bag",
          price: 234,
          size: 8,
          description: dummyText,
          image: "assets/images/bag_2.png",
          color: Color(0xFFD3A984),
          check: 0),
    ],
  ),
  ProductGroup(
    id: 1,
    name: "Jewellery",
    products: [
      Product(
          id: 1,
          title: "Office Code",
          price: 234.01,
          size: 12,
          description: dummyText,
          image: "assets/images/bag_2.png",
          color: Color(0xFF3D82AE),
          check: 0),
      Product(
          id: 4,
          title: "Old Fashion",
          price: 234,
          size: 11,
          description: dummyText,
          image: "assets/images/bag_4.png",
          color: Color(0xFFE6B398),
          check: 2),
      Product(
          id: 5,
          title: "Office Code",
          price: 234,
          size: 12,
          description: dummyText,
          image: "assets/images/bag_5.png",
          color: Color(0xFFFB7883),
          check: 1),
    ],
  ),
  ProductGroup(
    id: 2,
    name: "Footwear",
    products: [
      Product(
          id: 1,
          title: "Office Code",
          price: 234.01,
          size: 12,
          description: dummyText,
          image: "assets/images/bag_3.png",
          color: Color(0xFF3D82AE),
          check: 0),
      Product(
        id: 6,
        title: "Office Code",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/bag_6.png",
        color: Color(0xFFAEAEAE),
        check: 3,
      ),
    ],
  ),
  ProductGroup(
    id: 3,
    name: "Dresses",
    products: [
      Product(
          id: 1,
          title: "Office Code",
          price: 234.01,
          size: 12,
          description: dummyText,
          image: "assets/images/bag_4.png",
          color: Color(0xFF3D82AE),
          check: 0),
    ],
  ),
];
List<Product> products = [
  Product(
      id: 1,
      title: "Office Code",
      price: 234.01,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_1.png",
      color: Color(0xFF3D82AE),
      check: 0),
  Product(
      id: 2,
      title: "Belt Bag",
      price: 234,
      size: 8,
      description: dummyText,
      image: "assets/images/bag_2.png",
      color: Color(0xFFD3A984),
      check: 0),
  Product(
      id: 3,
      title: "Hang Top",
      price: 234,
      size: 10,
      description: dummyText,
      image: "assets/images/bag_3.png",
      color: Color(0xFF989493),
      check: 0),
  Product(
      id: 4,
      title: "Old Fashion",
      price: 234,
      size: 11,
      description: dummyText,
      image: "assets/images/bag_4.png",
      color: Color(0xFFE6B398),
      check: 2),
  Product(
      id: 5,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_5.png",
      color: Color(0xFFFB7883),
      check: 1),
  Product(
    id: 6,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/bag_6.png",
    color: Color(0xFFAEAEAE),
    check: 3,
  ),
];
String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
