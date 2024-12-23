import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartBottomAppbar extends ConsumerStatefulWidget {
  const CartBottomAppbar({Key? key}) : super(key: key);

  @override
  ConsumerState<CartBottomAppbar> createState() => _CartBottomAppbar();
}

class _CartBottomAppbar extends ConsumerState<CartBottomAppbar> {
  int count = 0;
  int total_price = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Container(
      height: 100,
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: Column(
        children: [
          Container(
            width: size,
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("총 $count개 / 20",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                Text("$total_price원"),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.deepOrange,
              fixedSize: Size(size, 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {

            },
            child: const Text(
              '주문하기'
            ),
          ),
        ],
      ),
    );
  }
}
