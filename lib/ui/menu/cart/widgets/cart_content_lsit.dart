import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartContentList extends ConsumerStatefulWidget {
  const CartContentList({Key? key}) : super(key: key);

  @override
  ConsumerState<CartContentList> createState() => _CartContentList();
}

class _CartContentList extends ConsumerState<CartContentList> {
  int count = 1;
  int menu_price = 4500;
  int menu_count = 1;
  int total_price = 0;
  String menu_name_kor = "메뉴 이름";
  String menu_name_eng = "Menu Name";
  String menu_option = "Option List";
  bool? isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(0, 5, 10, 15),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  onChanged: (bool? value) {
                    setState(() {
                      isSelected = value;
                    });
                  }
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),  //padding 제거
                color: Colors.grey,
                onPressed: () {},
                icon: const Icon(Icons.highlight_remove),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      //메뉴 상세페이지 열기
                    });
                  },
                  child: Container( //이미지 넣을 자리
                    margin: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                    color: Colors.black,
                    height: 100,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          //메뉴 상세페이지 열기
                        });
                      },
                      child: Text(menu_name_kor,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(menu_name_eng,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Text(menu_option,
                            //textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Text("4,500원",
                            //textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //const Padding(padding: EdgeInsets.only(bottom: 10)),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        //tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {  },
                      child: TextButton(
                        style: TextButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {

                        },
                        child: const Text(
                          "옵션 변경",
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    //const Padding(padding: EdgeInsets.only(bottom: 10)),
                    Row(
                      children: [
                        Flexible(
                            fit: FlexFit.tight,
                            child: Row(
                              children: [
                                IconButton(
                                  padding: const EdgeInsets.only(right: 15),
                                  constraints: const BoxConstraints(),
                                  style: const ButtonStyle(
                                    splashFactory: NoSplash.splashFactory,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if(menu_count > 1) {
                                        menu_count--;
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                                Text("$menu_count",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  padding: const EdgeInsets.only(left: 15),
                                  constraints: const BoxConstraints(),
                                  style: const ButtonStyle(
                                    splashFactory: NoSplash.splashFactory,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      menu_count++;
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            )
                        ),
                        Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              "${menu_price * menu_count}원",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            )
                        ),
                      ],
                    )
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
