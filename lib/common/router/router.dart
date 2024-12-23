import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:joodle_ver_one/common/router/routes.dart';
import 'package:joodle_ver_one/ui/login/change_password_page.dart';
import 'package:joodle_ver_one/ui/login/login_page.dart';
import 'package:joodle_ver_one/ui/login/signup_confirm_page.dart';
import 'package:joodle_ver_one/ui/login/signup_page.dart';
import 'package:joodle_ver_one/ui/menu/home/home_page.dart';
import 'package:joodle_ver_one/ui/menu/detail/detail_page.dart';

final route = GoRouter(
    routes: [
      GoRoute(path: '/',
      builder: (context, state) => Container()),

      GoRoute(path: '/login',
      builder: (context, state) => const LoginPage()),

      GoRoute(path: '/signup',
      builder: (context, state) => const SignUpScreen()),

      GoRoute(path: '/signupconfirm',
      builder: (context, state) => const SignUpConfirmScreen()),

      GoRoute(path: '/findpassword',
      builder: (context, state) => const ChangePasswordPage()),
      
      GoRoute(path: '/menu',
      name: AppRoute.menu.name,
      builder: (_, state) => HomePage()),
      
      GoRoute(path: '/menu/detail',
      name: AppRoute.menuDetail.name,
      builder: (_, state) => const DetailPage())
      //builder: (_, state) => DetailPage(id:state.params["id"]!))
    ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text(state.error.toString()),
    ),
  )
);