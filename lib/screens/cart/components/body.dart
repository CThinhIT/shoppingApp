import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/contants.dart';
import 'package:shopping/core/ui_model/product.dart';
import 'package:shopping/core/view-model/screens/implements/basket_view_model.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BasketViewModel>(builder: (_, vm, __) {
      return ListView.builder(
        itemCount: vm.basketItems.length,
        itemBuilder: ((context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: Dismissible(
                key: Key(vm.basketItems[index].id.toString()),
                background: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFFE6E5),
                  ),
                  child: Row(
                    children: [
                      Spacer(),
                      Icon(
                        Icons.delete,
                        size: 40,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
                child: CartItem(
                  product: vm.basketItems[index].product,
                  qty: vm.basketItems[index].quantity,
                ),
                onDismissed: (DismissDirection direction) {
                  vm.removeProduct(vm.basketItems[index].id);
                  setState(() {
                    vm.basketItems.removeAt(index);
                  });
                  ;
                },
              ),
            )),
      );
    });
  }
}

class CartItem extends StatelessWidget {
  final product;
  final int qty;
  const CartItem({
    Key? key,
    required this.product,
    required this.qty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 100,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Image.asset(product.image),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Text(
              product.title,
              style: TextStyle(
                fontSize: 16,
              ),
              maxLines: 2,
            ),
            Text.rich(
              TextSpan(
                text: "\$${product.price * qty}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 40,
          height: 32,
          child: OutlineButton(
            padding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
            onPressed: () {
              context.read<BasketViewModel>().remove(product.id);
            },
            child: Icon(Icons.remove),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "${qty}",
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
            onPressed: () {
              context.read<BasketViewModel>().add(product.id);
            },
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
