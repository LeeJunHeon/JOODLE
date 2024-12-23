import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readmore/readmore.dart';

import '../../../../repo/detailpage_repo.dart';
import '../../../../repo/menupage_repo.dart';

class DetailInfo extends ConsumerWidget {
  String menu_name = "메뉴 이름";
  String content = "메뉴 상세설명";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(25, 10, 15, 0),
          child: Text(
            menu_name,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          color: Colors.white,
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(25, 10, 15, 10),
          child: ReadMoreText(
            content,
            trimLines: 3,
            trimMode: TrimMode.Line,
            trimCollapsedText: " 더보기",
            trimExpandedText:  " 숨기기",
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green[700],
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green[700],
            ),
          ),
        ),
      ],
    );
  }
}
