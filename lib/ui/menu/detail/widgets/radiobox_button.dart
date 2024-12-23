import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:joodle_ver_one/repo/detailpage_repo.dart';
import 'package:joodle_ver_one/models/ModelProvider.dart';
import 'package:joodle_ver_one/ui/menu/detail/widgets/white_space.dart';

class RadioButton extends ConsumerStatefulWidget {
  const RadioButton({Key? key}) : super(key: key);

  @override
  ConsumerState<RadioButton> createState() => _radioButton();
}

class _radioButton extends ConsumerState<RadioButton> {
  var f = NumberFormat('###,###,###,###'); //3자리마다 쉼표

  @override
  Widget build(BuildContext context) {
    final List<RadioboxModel> _radioboxes = ref.watch(menuRadioboxProvider);

    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _radioboxes.length,
      itemBuilder: (context, index1) {
        return Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.fromLTRB(25, 10, 15, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _radioboxes[index1].name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "필수",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _radioboxes[index1].option?.length,
              itemBuilder: (context, index2) {
                return RadioListTile(
                  title: Text(_radioboxes[index1].option![index2]),
                  secondary: Text(f.format(_radioboxes[index1].price![index2])),
                  value: index2, // 선택된 radiobox의 인덱스 값을 사용
                  groupValue: _radioboxes[index1].isSelected![0], //isSelected의 초기값을 0으로 설정
                  onChanged: (val) {
                    setState(() {
                      _radioboxes[index1].isSelected![0] = val!;
                    });
                  },
                );
              },
            ),
            WhiteSpace(),
          ],
        );
      },
    );
  }
}