import 'package:flutter/material.dart';
import 'package:joodle_ver_one/utils/colors.dart';

class PasswordTextInput extends StatelessWidget {
  const PasswordTextInput({
    required String hintText,
    EdgeInsets padding = const EdgeInsets.only(left: 40),
    Key? key, required this.textEditingController,
  })  : _hintText = hintText,
        _padding = padding,
        super(key: key);

  final String _hintText;
  final EdgeInsets _padding;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: ShapeDecoration(
        color: AppColors.buttonBackgroundColor,
        shape: const StadiumBorder(),
      ),
      child: TextField(
        maxLines: 1,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        controller: textEditingController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: _hintText,
          hintStyle: TextStyle(
            color: AppColors.placeholder,
          ),
          contentPadding: _padding,
        ),
      ),
    );
  }
}
