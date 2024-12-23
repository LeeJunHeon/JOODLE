import 'package:flutter/material.dart';

class CautionMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.warning_amber,
            size: 12,
          ),
          Text(
            "  메뉴 사진은 연출된 이미지로 실제 조리된 음식과 다를 수 있습니다.",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
