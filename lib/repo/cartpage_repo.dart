import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/ShoppingCartModel.dart';

final menuNameInCart = StateProvider<String> ((ref) {
  String menuName = "";
  return menuName;
});

final menuPriceInCart = StateProvider<int> ((ref) {
  int menuPrice = 0;
  return menuPrice;
});

final shoppingCartProvider = StateNotifierProvider<shoppingCartStateNotifier, List<ShoppingCartModel>>((ref) {
  return shoppingCartStateNotifier();
});

class shoppingCartStateNotifier extends StateNotifier<List<ShoppingCartModel>> {
  shoppingCartStateNotifier() : super([]);

  void addCart(ShoppingCartModel newCart) {
    state = [...state, newCart];
  }

  void removeCart(ShoppingCartModel removeCart) {
    //상태(state)에서 removeCart와 일치하지 않는 cart들로 구성된 새로운 리스트로 상태(state) 설정, 따라서 해당 cart는 삭제됨
    state = state.where((cart) => cart != removeCart).toList();
  }

  void addOption(String cartId, cartOption) {
    state = state.map((cart) {
      if (cart.id == cartId) {
        return cart.copyWith(option: cartOption);
      } else {
        return cart;
      }
    }).toList();
  }

  void addName(String cartName) {
    state = state.map((cart) {
      return cart.copyWith(name: cartName);
    }).toList();
  }

}