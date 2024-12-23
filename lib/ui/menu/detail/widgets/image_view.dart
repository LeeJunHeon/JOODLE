import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:joodle_ver_one/ui/menu/detail/widgets/image_full_view.dart';

class ImageView extends StatefulWidget {
  const ImageView({Key? key}) : super(key: key);

  @override
  State<ImageView> createState() => _imageView();
}

class _imageView extends State<ImageView> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return const ImageFullView();
            },
          ),
          );
        },
        child: CarouselSlider(
          items: [

          ],
          options: CarouselOptions(
            autoPlay: true,
            onPageChanged: (index, other) {
              setState(() {
                //_currentPage = index; //image number
                //_currentKeyWord = keywords[_currentPage]
              }
              );
            },
          ),
        ),
      ),
    );
  }
}
