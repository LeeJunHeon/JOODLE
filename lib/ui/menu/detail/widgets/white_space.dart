import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhiteSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container( // Container 사이 여백
      color: Colors.grey[300],
      width: double.infinity,
      height: 10,
    );
  }
}
