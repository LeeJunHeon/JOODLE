/*
import 'dart:math';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:joodle_ver_one/ui/menu/home/widgets/food_card.dart';

import '../../../amplifyconfiguration.dart';
import 'package:flutter/material.dart';
import 'package:joodle_ver_one/ui/menu/componets/menu_list.dart' as MenuList;

class MenuPage extends StatefulWidget{
  const MenuPage({super.key});

  @override
  _menuPage createState() => _menuPage();
}

class _menuPage extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  left: 20.0,
                  right: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '김밥천국 화성향남점',
                      style: TextStyle(fontSize: 21.0),
                    ),
                    //Icon(Icons.notifications_none, size: 28.0) 우상단 종아이콘
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 25.0,
                  left: 20.0,
                  right: 20.0,
                ),
                child: TextField(
                  keyboardType: TextInputType.text,
                  autocorrect: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[300]!, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: theme.primaryColor, width: 1.0),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 28.0,
                      color: theme.primaryColor,
                    ),
                    hintText: '찾으시는 메뉴를 검색하세요.',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 19.0,
                    ),
                  ),
                ),
              ),
              Container(
                height: 105,
                margin: const EdgeInsets.only(
                  top: 20.0,
                  bottom: 25.0,
                ),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(
                      left: 20.0,
                    ),
                    itemCount: MenuList.foodCategorys.length,
                    itemBuilder: (context, index) {
                      Map<String, String> option = MenuList.foodCategorys[index];
                      return Container(
                        margin: const EdgeInsets.only(right: 35.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 70,
                              height: 70,
                              margin: const EdgeInsets.only(bottom: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                    option['image']!,
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10.0,
                                    color: Colors.grey[300]!,
                                    offset: Offset(6.0, 6.0),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              option['name']!,
                              style: TextStyle(fontSize: 17.0),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                child: Text(
                  'Popular Food',
                  style: TextStyle(fontSize: 21.0),
                ),
              ),
              Container(
                height: 220.0,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 10.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: MenuList.popularFood.length,
                  itemBuilder: (context, index) {
                    Map<String, String> product = MenuList.popularFood[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'details', arguments: {
                          'product': product,
                          'index': index,
                        },
                        );
                      },
                      //() => Navigator.push(context, MaterialPageRoute(builder: (_) => const DetailPage()));
                      //context.go('/menu/detail');
                      //var id = product['id'];
                      //context.go('/menu/$id');
                      child: Hero(
                        tag: 'detail_food$index',
                        child: FoodCard(
                          width: size.width / 2 - 30.0,
                          primaryColor: theme.primaryColor,
                          productName: product['name'],
                          productPrice: product['price'],
                          productUrl: product['image'],
                          productClients: product['clients'],
                          productRate: product['rate'],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  bottom: 10.0,
                  top: 35.0,
                ),
                child: Text(
                  'Best Food',
                  style: TextStyle(fontSize: 21.0),
                ),
              ),
              Container(
                width: size.width - 40,
                color: Colors.white,
                padding: const EdgeInsets.only(bottom: 10.0),
                margin: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 15.0,
                ),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: size.width - 40,
                          width: size.width - 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                            image: DecorationImage(
                              image: AssetImage('assets/images/menu/plate-005.jpg'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        bottom: 4.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'The number one!',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '5.0 \(150\)',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[400],
                            ),
                          ),
                          Text(
                            '\$ 26.00',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
*/
/*
import 'package:flutter/material.dart';

import 'package:joodle_ver_one/ui/menu/home/widgets/menu_list.dart';
import 'package:joodle_ver_one/ui/menu/home/widgets/menu_popular.dart';
import 'package:joodle_ver_one/ui/menu/home/widgets/menu_category.dart';

import '../detail/widgets/image_view.dart';

class MenuPage extends StatefulWidget{
  const MenuPage({super.key});

  @override
  _menuPage createState() => _menuPage();
}

class _menuPage extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverLayoutBuilder(
            builder: (BuildContext context, constraints) {
              final scrolled = constraints.scrollOffset > 190; //scroll 크기 감지
              return SliverAppBar(
                backgroundColor: scrolled ? Colors.white : Colors.transparent,
                pinned: true, // appbar 완전히 사라지게
                expandedHeight: 250.0, // appbar 크기
                title: Text(
                  "김밥천국 화성향남점",
                  style: TextStyle(color: scrolled ? Colors.black : Colors.transparent),
                ),
                stretch: true, //glow 현상 없앰
                actions: [
                  IconButton(
                    icon: const Icon(Icons.home_outlined),
                    tooltip: 'Open home',
                    onPressed: () {
                      //handle the press
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.share_outlined),
                    tooltip: 'Open home',
                    onPressed: () {
                      //handle the press
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    tooltip: 'Open shopping cart',
                    onPressed: () {
                      //handle the press
                    },
                  ),
                ],
                iconTheme: IconThemeData(
                  color: scrolled ? Colors.black : Colors.white,
                ),
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    stretchModes: const [
                      StretchMode.zoomBackground,
                    ],
                    background: scrolled ?
                    Container() : const ImageView() //scroll정도에 따라 빈 container 또는 image
                ),
              );
            },
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    MenuCategory(),
                    MenuPopular(),
                    MenuListView(),
                  ],
                );
              },
              childCount: 1,
            ),
          ),
        ],),
    );
  }
}
*/

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';

import 'package:joodle_ver_one/ui/menu/home/widgets/menu_list.dart';
import 'package:joodle_ver_one/ui/menu/home/widgets/menu_popular.dart';
import 'package:joodle_ver_one/ui/menu/home/widgets/menu_category.dart';
import 'package:joodle_ver_one/ui/menu/home/widgets/store_info.dart';

import '../../../controller/login_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _homePage();
}

class _homePage extends State<HomePage> {

  late bool isLogined = false;
  @override
  initState() {
    super.initState();
      _checkLoginStatue();
      print('login statue is: ${isUserSignedIn()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(Icons.menu_outlined, size: 30, color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/nfckit');
                },
                child: const Icon(Icons.nfc_outlined, size: 30, color: Colors.black,)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/shoppingcart');
                },
                child: const Icon(Icons.shopping_cart, size: 30, color: Colors.black)
            ),
          ),
          Visibility(
            visible: isLogined,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: GestureDetector(
                  onTap: (){
                    //TODO: if(isLogined?) 추가
                    Amplify.Auth.signOut();
                    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                  },
                  child: const Icon(Icons.logout, size: 30, color: Colors.black)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/login');
                  //TODO: isLogined = true ? 마이페이지로 넘어가게 해야됨
                },
                child: const Icon(Icons.person, size: 30, color: Colors.black)
            ),
          ),
        ],

      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StoreInfo(),
              MenuCategory(),
              MenuPopular(),
              MenuListView(),
            ],
          ),
        ),
      ),
    );
  }
  void _checkLoginStatue() async{
    bool result = await _isLogined();
    setState(() {
      isLogined = result;
    });
  }

  Future<bool> _isLogined() async {
    bool isLogined = await isUserSignedIn();
    return isLogined;
  }
}
