import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/contants.dart';
import 'package:shopping/core/ui_model/product.dart';
import 'package:provider/provider.dart';
import 'package:shopping/core/view-model/screens/implements/basket_view_model.dart';
import 'package:shopping/screens/cart/cartScreen.dart';

class Body extends StatefulWidget {
  final Product product;
  const Body({Key? key, required this.product}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late int numOfItem;
  @override
  void initState() {
    numOfItem = 0; //TO DO get quantity
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.35),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ColorAndSize(product: widget.product),
                      Description(product: widget.product),
                      _CartCounter(
                        onAdd: () {
                          setState(() {
                            numOfItem++;
                          });
                        },
                        onRemove: numOfItem > 0
                            ? () {
                                setState(() {
                                  numOfItem--;
                                });
                              }
                            : null,
                        product: widget.product,
                        numOfItem: numOfItem,
                      ),
                      CartAndBuy(
                        numOfItem: numOfItem,
                        product: widget.product,
                      )
                    ],
                  ),
                ),
                TitleImages(product: widget.product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartAndBuy extends StatelessWidget {
  final Product product;
  final int numOfItem;
  CartAndBuy({Key? key, required this.product, required this.numOfItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: kDefaultPaddin),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: product.color,
            ),
          ),
          child: IconButton(
            icon: Icon(Icons.shopping_cart_checkout),
            onPressed: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 50,
            child: GestureDetector(
              onTap: numOfItem > 0
                  ? () {
                      context
                          .read<BasketViewModel>()
                          .addProduct(product.id, numOfItem);
                      Navigator.pushNamed(context, CartScreen.routeName);
                    }
                  : null,
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    color: numOfItem > 0 ? product.color : Colors.grey,
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: const Center(
                  child: Text(
                    "Buy now",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
    ;
  }
}

class _CartCounter extends StatelessWidget {
  final Function() onAdd;
  final Function()? onRemove;
  final Product product;
  final int numOfItem;
  const _CartCounter({
    Key? key,
    required this.onAdd,
    this.onRemove,
    required this.product,
    required this.numOfItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 40,
          height: 32,
          child: OutlineButton(
            padding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
            onPressed: onRemove,
            child: Icon(Icons.remove),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "$numOfItem",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        SizedBox(
          width: 40,
          height: 32,
          child: OutlineButton(
            padding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
            onPressed: onAdd,
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        product.description,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Color"),
              Row(
                children: [
                  ColorDot(
                    color: Color(0xFF356C95),
                    isSelected: true,
                  ),
                  ColorDot(
                    color: Color.fromARGB(255, 203, 148, 29),
                  ),
                  ColorDot(
                    color: Color.fromARGB(255, 89, 93, 96),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: kTextColor),
              children: [
                TextSpan(
                  text: "Size\n",
                ),
                TextSpan(
                  text: "${product.size}cm",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(
          top: kDefaultPaddin / 4,
          right: kDefaultPaddin / 2,
        ),
        padding: EdgeInsets.all(2.5),
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? color : Colors.transparent,
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class TitleImages extends StatelessWidget {
  const TitleImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Aristocratic Hand Bag",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.title,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: kDefaultPaddin),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Price\n"),
                    TextSpan(
                      text: "\$${product.price}",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
