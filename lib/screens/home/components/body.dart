import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/contants.dart';
import 'package:shopping/core/ui_model/product.dart';
import 'package:shopping/screens/detail/product_detail_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late int selectedIndex;
  List<Product> selectedProducts = productGroups[0].products;
  // List<Product> selectedProducts;
  @override
  void initState() {
    selectedIndex = 0; //TO DO get quantity
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "Home Page",
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),

        Row(
          children: [
            ...productGroups.map(
              (e) => Categories(
                selectedIndex: selectedIndex,
                onSelect: () {
                  setState(
                    () {
                      selectedIndex = e.id;
                      selectedProducts = e.products;
                    },
                  );
                },
                categories: e.name,
              ),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
              itemCount: selectedProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => ItemCard(
                product: selectedProducts[index],
                selectedIndex: selectedIndex,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ItemCard extends StatelessWidget {
  final Product product;
  final int selectedIndex;

  const ItemCard({
    Key? key,
    required this.product,
    required this.selectedIndex,
    // required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(
                      product: product,
                    )));
      }),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(kDefaultPaddin),
            height: 180,
            width: 160,
            decoration: BoxDecoration(
                color: product.color, borderRadius: BorderRadius.circular(16)),
            child: Image.asset(product.image),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              product.title,
              style: TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "\$${product.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  final int selectedIndex;
  final Function() onSelect;
  final String categories;

  Categories(
      {Key? key,
      required this.selectedIndex,
      required this.onSelect,
      required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
          // height: 25,
          child: GestureDetector(
        onTap: (() {
          onSelect();
        }),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categories,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // color: selectedIndex == index ? kTextColor : kTextLightColor,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: kDefaultPaddin / 4),
                height: 2,
                width: 30,
                // color: selectedIndex == index ? Colors.black : Colors.transparent,
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: (() {
        onSelect();
      }),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPaddin / 4),
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
