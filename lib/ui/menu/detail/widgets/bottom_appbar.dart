import 'package:amplify_core/amplify_core.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../controller/cart_controller.dart';
import '../../../../models/CheckboxModel.dart';
import '../../../../models/RadioboxModel.dart';
import '../../../../models/ShoppingCartModel.dart';
import '../../../../repo/cartpage_repo.dart';
import '../../../../repo/detailpage_repo.dart';

class BottomBar extends ConsumerWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //List<Cart> cartList = ref.watch(shoppingCartProvider);
    final List<CheckboxModel> _checkboxes = ref.watch(menuCheckboxProvider);
    var f = NumberFormat('###,###,###,###'); //3자리마다 쉼표
    int total_price = 0;

    Future<void> _saveShoppingCart(String name, int price, String option, int count, bool isSelected, int sequence, {required String image_info}) async {
      final _name = name;
      final _price = price;
      final _option = option;
      final _count = count;
      final _isSelected = isSelected;
      final _sequence = sequence;
      final _iamge_info = image_info.isNotEmpty ? image_info : null;

      final item = ShoppingCartModel(
        name: _name,
        price: _price,
        option: _option,
        count: _count,
        isSelected: _isSelected,
        sequence: _sequence,
        iamge_info: _iamge_info
      );
      try {
        //await Amplify.DataStore.save(item);
      } catch (e) {
        safePrint('An error occurred while saving Todo: $e');
      }
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange,
        ),
        onPressed: () {
          final List<RadioboxModel> _radioboxes = ref.watch(menuRadioboxProvider);
          final List<CheckboxModel> _checkboxes = ref.watch(menuCheckboxProvider);
          ///옵션값을 스트링으로 반환하는 함수 실행
          //for (dynamic item in getOptionNamePrice(_radioboxes, _checkboxes)) {
          //  print(item);
          //}

          final String _menuname = ref.watch(menuNameInCart);
          final int _menuprice = ref.watch(menuPriceInCart);

          print(_menuname);
          print(getOptionNamePrice(_radioboxes, _checkboxes)[0]);
          print(getOptionNamePrice(_radioboxes, _checkboxes)[1] + _menuprice);
          //int menu_count = ref.watch(foodCounterProvider);
          //print(menu_count);

          //print(_menuname);
          //print(_menuprice);
          /*
          final List<String> option = [];

          //radiobox에서 선택된 옵션을 불러옴
          final List<RadioboxModel> _radioboxes = ref.watch(menuRadioboxProvider);
          _radioboxes.forEach((radiobox) {
            option.add(radiobox.option![radiobox.isSelected![0]]);
          });

          //checkbox에서 선택된 옵션을 불러옴
          final List<CheckboxModel> _checkboxes = ref.watch(menuCheckboxProvider);
          _checkboxes.forEach((checkbox) {
            checkbox.isSelected!.asMap().forEach((index, selected) {
              if (selected == true) {
                option.add(checkbox.option![index]);
              }
            });
          });

          //위 옵션들을 하나의 String으로 변환, 이때 사이에 |를 추가함
          final String option_result = option.join(" | ");
          */
          /*
          print("Provider 사용전");
          print(cartList);
          final List<String> option = ["옵션1", "옵션2"];
          final cart = Cart(id: "1", name: "메뉴1", price: 1000, option: option, count: 1, sequence: 1);
          ref.read(shoppingCartProvider.notifier).addCart(cart);
          cartList = ref.watch(shoppingCartProvider);
          print("Provider 사용후");
          for(int i = 0; i < cartList.length; i++) {
            print("$i번째 옵션");
            print(cartList[i].option);
          }*/
          //_saveShoppingCart("메뉴1", 1000, "계란말이 추가 | 포장 | 밥 추가", 5, false, 1, image_info: '');
        },
        child: Text(
          '0원 담기',
          //'${f.format(ref.watch(foodCounterProvider))}원 담기'
        ),
      ),
    );
  }
}