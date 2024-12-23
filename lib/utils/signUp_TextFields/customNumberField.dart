import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomNumberField extends StatelessWidget {
  const CustomNumberField({Key? key, required this.textEditingController, required this.iconData, required this.hintText, required this.textInputAction}) : super(key: key);

  final TextEditingController textEditingController;
  final IconData iconData;
  final String hintText;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height / 12,
      child: TextField(
        controller: textEditingController,
        style: GoogleFonts.inter(
          fontSize: 18.0,
          color: const Color(0xFF151624),
        ),
        maxLines: 1,
        keyboardType: TextInputType.phone,
        textInputAction: textInputAction,
        onSubmitted: (_) => FocusScope.of(context).nextFocus(),
        inputFormatters: [FilteringTextInputFormatter(RegExp('[0-9]'), allow: true,)],
        cursorColor: const Color(0xFF151624),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.inter(
            fontSize: 16.0,
            color: const Color(0xFF151624).withOpacity(0.5),
          ),
          fillColor: textEditingController.text.isNotEmpty ? Colors.transparent : const Color.fromRGBO(248, 247, 251, 1),
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(
                color: textEditingController.text.isEmpty ? Colors.transparent : const Color.fromRGBO(44, 185, 176, 1),
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: const BorderSide(
                color: Color.fromRGBO(44, 185, 176, 1),
              )),
          prefixIcon: Icon(
            iconData,
            color: textEditingController.text.isEmpty ? const Color(0xFF151624).withOpacity(0.5) : const Color.fromRGBO(44, 185, 176, 1),
            size: 20,
          ),
        ),
      ),
    );
  }
}
