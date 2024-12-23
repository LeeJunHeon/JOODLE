import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({Key? key, required this.string, required this.function, required this.width}) : super(key: key);

  final Future<void> function;
  final String string;
  final double width;
  final double height = 50;
  final double fontSize = 18.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: () {
          function;
        },
        style: ElevatedButton.styleFrom(
          primary: AppColors.orange,
        ),
        child: Text(
          string,
          style: GoogleFonts.inter(
            fontSize: fontSize,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
