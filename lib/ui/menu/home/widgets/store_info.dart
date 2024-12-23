import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StoreInfo extends StatelessWidget {
  const StoreInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Center(
            child: Image.asset("assets/images/logo/joodle_logo_1.png",
            scale: 12,),
          ),
          SizedBox(height: 20,),
          /// 메인 페이지 로고 우측 아래 아이콘
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     GestureDetector(
          //         onTap: (){
          //           Navigator.pushNamed(context, '/nfckit');
          //         },
          //         child: const Icon(Icons.nfc_outlined, size: 30,)),
          //     const SizedBox(width: 10,),
          //   GestureDetector(
          //     onTap: (){
          //       //TODO: if(isLogined?) 추가
          //       Amplify.Auth.signOut();
          //       Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
          //     },
          //       child: const Icon(Icons.logout, size: 30,)),
          //   const SizedBox(width: 10,),
          //   GestureDetector(
          //     onTap: (){
          //       Navigator.pushNamed(context, '/login');
          //       //TODO: isLogined = true ? 마이페이지로 넘어가게 해야됨
          //     },
          //       child: const Icon(Icons.person, size: 30)),
          //   const SizedBox(width: 10,),
          // ],)
        ],
      ),
    );
  }
}
