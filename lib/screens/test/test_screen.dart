import 'package:flutter/material.dart';
import 'package:shopping/core/ui_model/voucher.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);
  static String routeName = "/";

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Voucher"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Voucher Của Tôi",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 166, 165, 165),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Voucher Hot",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              height: 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Color.fromARGB(255, 166, 165, 165),
              ),
            ),
            ...voucher.map(
              (e) => itemVoucher(
                color: e.color,
                price: e.price,
                title: e.title,
                voucher: e.discount,
              ),
            ),
            // itemVoucher(
            //   color: Colors.yellow,
            // ),
            // itemVoucher(
            //   color: Colors.red,
            // ),
            // itemVoucher(
            //   color: Colors.blue,
            // ),
            // itemVoucher(
            //   color: Colors.pink,
            // ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 72, 71, 71)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.home),
            ),
          ],
        ),
      ),
    );
  }
}

class itemVoucher extends StatelessWidget {
  final Color color;
  final String title;
  final double price, voucher;

  const itemVoucher({
    Key? key,
    required this.color,
    required this.title,
    required this.price,
    required this.voucher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        items(color: color),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Text(
                "Combo sản phẩm gia vị",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "Chinsu ngày Tết",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text("${voucher}00đ  ",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.red)),
                  Text("${price}00đ",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 168, 167, 167))),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

// Column(
//         children: [
//           Column(
//             children: [
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     items(color: Colors.red),
//                     items(color: Colors.blue),
//                     items(color: Colors.purple),
//                     items(color: Colors.black),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 150,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       items(color: Colors.red),
//                       items(color: Colors.blue),
//                       items(color: Colors.purple),
//                       items(color: Colors.black),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 300,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         items(color: Colors.red),
//                         items(color: Colors.blue),
//                         items(color: Colors.purple),
//                         items(color: Colors.black),
//                       ],
//                     ),
//                   ),
//                   Column(
//                     children: [
//                       items(color: Colors.red),
//                       items(color: Colors.blue),
//                       items(color: Colors.purple),
//                       items(color: Colors.black),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
class items extends StatelessWidget {
  final Color color;
  const items({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 150,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: color,
        ),
      ),
    );
  }
}
