import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartTopAppbar extends ConsumerStatefulWidget {
  const CartTopAppbar({Key? key}) : super(key: key);

  @override
  ConsumerState<CartTopAppbar> createState() => _CartTopAppbar();
}

class _CartTopAppbar extends ConsumerState<CartTopAppbar> {
  bool? isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_outlined)
              ),
              const Text(
                "장바구니",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: isSelected,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                      side: const BorderSide(
                        color: Colors.deepOrange,
                        width: 1,
                      ),
                      activeColor: Colors.deepOrange,
                      checkColor: Colors.white,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: (bool? value) {
                        setState(() {
                          isSelected = value;
                        });
                      }
                    ),
                    const Text(
                      "전체 선택",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          splashFactory: NoSplash.splashFactory,
                          padding: const EdgeInsets.only(right: 5),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {

                        },
                        child: const Text(
                          "선택삭제",
                          style: TextStyle(
                            color: Colors.deepOrange,
                          ),
                        )
                    ),
                    const Text(" | "),
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        splashFactory: NoSplash.splashFactory,
                        padding: const EdgeInsets.only(left: 5),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {

                      },
                      child: const Text(
                        "전체삭제",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
