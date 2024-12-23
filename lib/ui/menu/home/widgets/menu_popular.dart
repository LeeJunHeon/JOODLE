import 'dart:async';
import 'dart:typed_data';

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/CheckboxModel.dart';
import '../../../../models/RadioboxModel.dart';
import '../../../../repo/detailpage_repo.dart';
import 'menu_list.dart';
import '../../../../models/PopularMenuListModel.dart';
import '../../../../repo/image_repo.dart';
import '../../../../repo/menupage_repo.dart';

class MenuPopular extends ConsumerStatefulWidget{
  const MenuPopular({Key? key}) : super(key: key);

  @override
  ConsumerState<MenuPopular> createState() => _MenuPopular();
}

class _MenuPopular extends ConsumerState<MenuPopular> {
  List<PopularMenuListModel> popularLists = [];

  @override
  void initState() {
    getPopularMenuList();
    super.initState();
  }

  Future<void> getPopularMenuList() async {
    Amplify.DataStore.observeQuery(
      PopularMenuListModel.classType,
      sortBy: [PopularMenuListModel.RANK.ascending()],
    ).listen((QuerySnapshot<PopularMenuListModel> snapshot) {
      setState(() {
        popularLists = snapshot.items;
      });
      ref.read(popularMenuListProvider.notifier).state = popularLists;
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
          padding: const EdgeInsets.fromLTRB(25, 10, 15, 0),
          child: const Text(
            "인기 메뉴",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 250,
          color: Colors.white,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 13 / 10,
              //mainAxisSpacing: 10,
              //crossAxisSpacing: 5,
            ),
            itemCount: popularLists.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  getCheckboxData(popularLists[index].name);
                  getRadioboxData(popularLists[index].name);
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
                        child: Image.memory(imageResults[index]),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Container(
                          height: 50,
                          color: Colors.white,
                          child: GridTileBar(
                            title: Text(
                              popularLists[index].name,
                              style: const TextStyle(color: Colors.black),
                            ),
                            subtitle: Text(
                              '${popularLists[index].price}원',
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
        ),
      ],
    );
  }
}
