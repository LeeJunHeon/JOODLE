

import '../models/CheckboxModel.dart';
import '../models/RadioboxModel.dart';

List<dynamic> getOptionNamePrice(List<RadioboxModel> _radioboxes, List<CheckboxModel> _checkboxes) {
  final List<dynamic> optionNamePrice = [];
  final List<String> option = [];
  int option_price = 0;


  //radiobox에서 선택된 옵션을 불러옴
  _radioboxes.forEach((radiobox) {
    option.add(radiobox.option![radiobox.isSelected![0]]);
    option_price = option_price + radiobox.price![radiobox.isSelected![0]];
  });

  //checkbox에서 선택된 옵션을 불러옴
  _checkboxes.forEach((checkbox) {
    checkbox.isSelected!.asMap().forEach((index, selected) {
      if (selected == true) {
        option.add(checkbox.option![index]);
        option_price = option_price + checkbox.price![index];
      }
    });
  });

  ///option_name과 option_price를 dynamic List에 넣어 return, 이때 각각의 자료형은 String, int로 문제없음
  //위 옵션들을 하나의 String으로 변환, 이때 사이에 |를 추가함
  optionNamePrice.add(option.join(" | "));
  optionNamePrice.add(option_price);

  return optionNamePrice;
}
