import 'dart:async';
import 'dart:typed_data';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:joodle_ver_one/models/ModelProvider.dart';

import '../../../../repo/cartpage_repo.dart';
import '../../../../repo/detailpage_repo.dart';
import '../../../../repo/image_repo.dart';
import '../../../../repo/menupage_repo.dart';

class MenuListView extends ConsumerStatefulWidget{
  const MenuListView({Key? key}) : super(key: key);

  @override
  ConsumerState<MenuListView> createState() => _MenuListView();
}

class _MenuListView extends ConsumerState<MenuListView> {
  List<MenuListModel> menuLists = [];

  @override
  void initState() {
    getMenuList();
    super.initState();
  }

  Future<void> getMenuList() async {
    Amplify.DataStore.observeQuery(
      MenuListModel.classType,
      sortBy: [MenuListModel.SEQUENCE_OUT.ascending()],
    ).listen((QuerySnapshot<MenuListModel> snapshot) {
      setState(() {
        menuLists = snapshot.items;
      });
      ref.read(menuListProvider.notifier).state = menuLists;
    });
  }

  Future<void> getCheckboxData(String menuNAME) async {
    final List<CheckboxModel> checkboxData = await Amplify.DataStore.query(
        CheckboxModel.classType,
        sortBy: [CheckboxModel.SEQUENCE.ascending()],
        where: CheckboxModel.MENU_NAME.eq(menuNAME));

    ref.read(menuCheckboxProvider.notifier).state = checkboxData;
  }

  Future<void> getRadioboxData(String menuNAME) async {
    final List<RadioboxModel> radioboxData = await Amplify.DataStore.query(
        RadioboxModel.classType,
        sortBy: [RadioboxModel.SEQUENCE.ascending()],
        where: RadioboxModel.MENU_NAME.eq(menuNAME));

    ref.read(menuRadioboxProvider.notifier).state = radioboxData;
  }

  @override
  Widget build(BuildContext context) {
    final List<Uint8List> imageResults = ref.watch(imageUnit8List);
    return Column(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
          child: const Text(
            "전체 메뉴",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          color: Colors.white,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: menuLists.length,
            itemBuilder: (context, index1) {
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(35, 20, 0, 0),
                    child: Text(
                      menuLists[index1].category_name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GridView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 4,
                      //mainAxisSpacing: 10,
                      //crossAxisSpacing: 5,
                    ),
                    itemCount: menuLists[index1].name?.length,
                    itemBuilder: (context, index2) {
                      return GestureDetector(
                        onTap: () {
                          getCheckboxData(menuLists[index1].name![index2]);
                          getRadioboxData(menuLists[index1].name![index2]);
                          ref.read(menuNameInCart.notifier).state = menuLists[index1].name![index2];
                          ref.read(menuPriceInCart.notifier).state = menuLists[index1].price![index2];
                          Navigator.pushNamed(context, '/details');
                        },
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          margin: const EdgeInsets.all(8),
                          elevation: 5,
                          child: Column(
                            children: [
                              Flexible(
                                flex: 3,
                                fit: FlexFit.tight,
                                child: Image.memory(imageResults[index2]),
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                child: Container(
                                  height: 50,
                                  color: Colors.white,
                                  child: GridTileBar(
                                    title: Text(
                                      menuLists[index1].name![index2],
                                      style: const TextStyle(color: Colors.black),
                                    ),
                                    subtitle: Text(
                                      '${menuLists[index1].price![index2]}원',
                                      style: const TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            }
          ),
        ),
      ],
    );
  }
}




