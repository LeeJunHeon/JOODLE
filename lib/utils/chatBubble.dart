import 'package:flutter/material.dart';

class ChatBubble extends CustomPainter {
  final Color color;
  final Offset position; // 위치를 나타내는 Offset 객체
  final String text; // 입력된 텍스트

  ChatBubble({
    this.color = Colors.deepOrange,
    this.position = Offset.zero, // 기본값은 (0, 0)으로 설정
    this.text = '',
  });

  @override
  void paint(Canvas canvas, Size canvasSize) {
    final textStyle = TextStyle(
      fontSize: 16,
      color: Colors.white,
    );

    final textSpan = TextSpan(text: text, style: textStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    final bubblePadding = EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0);
    final arrowSize = Size(20.0, 20.0); // 화살표의 크기를 설정합니다.

    final bubbleSize = Size(
      textPainter.width + bubblePadding.horizontal,
      textPainter.height + bubblePadding.vertical,
    );

    final bubbleRect = Rect.fromPoints(
      position,
      position + Offset(bubbleSize.width, bubbleSize.height+bubblePadding.vertical),
    );

    // 말풍선을 그립니다.
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        bubbleRect,
        Radius.circular(10.0),
      ),
      Paint()
        ..color = color
        ..isAntiAlias = false,
    );

    // 화살표가 가운데 아래를 향함
    /*final arrowPath = Path();
    arrowPath.moveTo(position.dx + bubbleSize.width / 2 - arrowSize.width / 2, bubbleRect.bottom);
    arrowPath.lineTo(position.dx + bubbleSize.width / 2 + arrowSize.width / 2, bubbleRect.bottom);
    arrowPath.lineTo(position.dx + bubbleSize.width / 2, bubbleRect.bottom + arrowSize.height);
    arrowPath.close();*/

    // 화살표를 가운데 위를 향하게 그림
/*
    final arrowPath = Path();
    arrowPath.moveTo(bubbleRect.left + bubbleSize.width / 2 - arrowSize.width / 2, bubbleRect.top);
    arrowPath.lineTo(bubbleRect.left + bubbleSize.width / 2 + arrowSize.width / 2, bubbleRect.top);
    arrowPath.lineTo(bubbleRect.left + bubbleSize.width / 2, bubbleRect.top - arrowSize.height);
    arrowPath.close();
*/

    final arrowPath = Path();
    arrowPath.moveTo(bubbleRect.right - 15, bubbleRect.top);
    arrowPath.lineTo(bubbleRect.right - 15 - arrowSize.width, bubbleRect.top);
    arrowPath.lineTo(bubbleRect.right - (arrowSize.width/2 + 15), bubbleRect.top - arrowSize.height);
    arrowPath.close();

    canvas.drawPath(
      arrowPath,
      Paint()
        ..color = color
        ..isAntiAlias = false,
    );

    // 말풍선의 높이를 기준으로 텍스트의 위치를 조정합니다.
    final textHeight = textPainter.height;
    final textOffsetY = (bubbleSize.height - textHeight) / 2;

// 텍스트를 그립니다.
    textPainter.paint(
      canvas,
      position + Offset(bubblePadding.left, bubblePadding.top + textOffsetY),
    );


    // 추가적인 그리기 로직이 필요한 경우 여기에 추가합니다.

    // ...
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
