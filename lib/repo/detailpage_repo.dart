import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joodle_ver_one/models/ModelProvider.dart';

final foodTotalPriceProvider = StateProvider<int> ( //특정 메뉴의 총 가격
  (ref) => 0 //기본 수량 1개
);

///menu의 수량을 변경하는 provider
class menuCounterProvider with ChangeNotifier {
  int _menuCount = 0;
  int get menuCount => _menuCount;

  void increment() {
    _menuCount++;
    notifyListeners();
  }

  void decrement() {
    if (_menuCount > 1) {
      _menuCount--;
      notifyListeners();
    }
  }
}

final menuCheckboxProvider = StateProvider<List<CheckboxModel>> ((ref) { //체크박스 데이터
  List<CheckboxModel> checkboxData = [];
  return checkboxData;
});

final menuRadioboxProvider = StateProvider<List<RadioboxModel>> ((ref) { //라디오박스 데이터
  List<RadioboxModel> radioboxData = [];
  return radioboxData;
});


