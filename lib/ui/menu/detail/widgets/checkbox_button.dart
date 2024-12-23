import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:joodle_ver_one/models/ModelProvider.dart';
import 'package:joodle_ver_one/ui/menu/detail/widgets/white_space.dart';
import '../../../../repo/cartpage_repo.dart';
import '../../../../repo/detailpage_repo.dart';
import '../../../../models/CheckboxModel.dart';

class CheckboxButton extends ConsumerStatefulWidget {
  const CheckboxButton({Key? key}) : super(key: key);

  @override
  ConsumerState<CheckboxButton> createState() => _checkboxButton();
}

class _checkboxButton extends ConsumerState<CheckboxButton> {
  var f = NumberFormat('###,###,###,###'); //3자리마다 쉼표

  @override
  Widget build(BuildContext context) {
    final List<CheckboxModel> _checkboxes = ref.watch(menuCheckboxProvider);

    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _checkboxes.length,
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
                    _checkboxes[index1].name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "선택",
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
              itemCount: _checkboxes[index1].option?.length,
              itemBuilder: (context, index2) {
                return CheckboxListTile(
                  title: Text(_checkboxes[index1].option![index2]),
                  secondary: Text(f.format(_checkboxes[index1].price![index2])),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _checkboxes[index1].isSelected![index2],
                  onChanged: (bool? val) {
                    setState(() {
                      _checkboxes[index1].isSelected![index2] = val!;
                      ref.read(menuCheckboxProvider.notifier).state  = _checkboxes;
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