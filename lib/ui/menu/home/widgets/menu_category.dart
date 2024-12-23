import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/MenuListModel.dart';
import '../../../../repo/detailpage_repo.dart';
import '../../../../repo/image_repo.dart';
import '../../../../repo/menupage_repo.dart';

class MenuCategory extends ConsumerStatefulWidget{
  const MenuCategory({Key? key}) : super(key: key);

  @override
  ConsumerState<MenuCategory> createState() => _MenuCategory();
}

class _MenuCategory extends ConsumerState<MenuCategory> {
  @override
  Widget build(BuildContext context) {
    final List<Uint8List> imageResults = ref.watch(imageUnit8List);
    final List<MenuListModel> menuLists = ref.watch(menuListProvider);

    return Column(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(25, 10, 15, 0),
          child: const Text(
            "카테고리",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 100,
          color: Colors.white,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: menuLists.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Chip(
                  label: Text(
                    menuLists[index].category_name,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.deepOrange,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                ),
              );
            }
          )
        )
        /*Container(
          height: 100,
          color: Colors.white,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 3 / 3,
            ),
            itemCount: 5,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {

                },
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.all(8),
                  elevation: 5,
                  child: Image.memory(imageResults[index]),
                ),
              );
            },
          ),
        ),*/
      ],
    );
  }
}
