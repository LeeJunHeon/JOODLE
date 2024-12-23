import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:joodle_ver_one/ui/menu/detail/detail_page.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);
  //const DetailPage({Key? key, String? id}) : super(key: key);

  @override
  _imagePage createState() => _imagePage();
}

class _imagePage extends State<ImagePage> {

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



/*
class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Map screenArguments = ModalRoute.of(context)!.settings.arguments as Map;
    Map product = screenArguments['product'];
    int index = screenArguments['index'];

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: 'detail_food$index',
            child: Container(
              alignment: Alignment.topCenter,
              width: size.width,
              height: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(product['image']),
                ),
              ),
            ),
          ),
          DetailPage(),
        ],
      ),
    );
  }
}
 */