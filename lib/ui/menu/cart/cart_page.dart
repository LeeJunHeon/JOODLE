import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joodle_ver_one/ui/menu/cart/widgets/bottom_appbar.dart';
import 'package:joodle_ver_one/ui/menu/cart/widgets/cart_content_lsit.dart';
import 'package:joodle_ver_one/ui/menu/cart/widgets/top_appbar.dart';


class CartPage extends ConsumerStatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CartPage> createState() => _CartPage();
}

class _CartPage extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Theme( //버튼 click 이벤트 투명화
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: const BottomAppBar(
          child: CartBottomAppbar(),
        ),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverAppBar(
              pinned: true,
              centerTitle: true,
              backgroundColor: Colors.white,
              toolbarHeight: 90,
              automaticallyImplyLeading: false,
              flexibleSpace: CartTopAppbar(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index){
                return Column(
                  children: const [
                    CartContentList(),
                    CartContentList(),
                    CartContentList(),
                    CartContentList(),
                  ],
                );
              },
              childCount: 1,
              ),
            )
          ],
        )
      ),
    );
  }
}
