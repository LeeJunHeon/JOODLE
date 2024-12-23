import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageFullView extends StatefulWidget {
  const ImageFullView({Key? key}) : super(key: key);
  //const DetailPage({Key? key, String? id}) : super(key: key);

  @override
  _imageFullView createState() => _imageFullView();
}

class _imageFullView extends State<ImageFullView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Hero(
        tag: "FullView",
        child: GestureDetector( // 아래로 드래그시 이전 페이지 구현 예정
          child: Container(
            color: Colors.black,
            width: double.infinity,
            height: double.infinity,
            child: CarouselSlider(
              items: [

              ],
              options: CarouselOptions(
              ),
            ),
          ),
        ),
      ),
    );
  }
}
