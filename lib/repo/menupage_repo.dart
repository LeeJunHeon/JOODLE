import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joodle_ver_one/models/ModelProvider.dart';

import '../models/PopularMenuListModel.dart';

final menuListProvider = StateProvider<List<MenuListModel>> ((ref) { //메뉴 데이터
  List<MenuListModel> menuData = [];
  return menuData;
});

final popularMenuListProvider = StateProvider<List<PopularMenuListModel>> ((ref) { //메뉴 데이터
  List<PopularMenuListModel> popularMenuData = [];
  return popularMenuData;
});