import 'package:flutter/material.dart';
import 'package:joodle_ver_one/utils/colors.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    required String hintText,
    EdgeInsets padding = const EdgeInsets.only(left: 40),
    Key? key, required this.textEditingController, required this.textInputType
  })  : _hintText = hintText, _padding = padding,
        super(key: key);

  final String _hintText;
  final EdgeInsets _padding;
  final TextEditingController textEditingController;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    var textInputType = this.textInputType;
    return Container(
      width: double.infinity,
      height: 50,
      decoration: ShapeDecoration(
        color: AppColors.buttonBackgroundColor,
        shape: const StadiumBorder(),
      ),
      child: Material(
        child: TextField(
          controller: textEditingController,
          maxLines: 1,
          keyboardType: textInputType,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: _hintText,
            hintStyle: TextStyle(
              color: AppColors.placeholder,
            ),
            contentPadding: _padding,
          ),
          maxLength: 11,
        ),
      ),
    );
  }
}
