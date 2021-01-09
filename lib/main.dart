import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_test_app/controller/sidebar_controller.dart';
import 'package:get_x_test_app/view/auth_forms/login_page.dart';
import 'package:get_x_test_app/view/background.dart';
import 'package:get_x_test_app/view/pages/cart_page.dart';
import 'package:get_x_test_app/view/pages/shopping_page.dart';

import 'view/sidebar/sidebar.dart';
import 'view/sidebar/sidebar_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Stack(children: [
        Background(),
        LoginPage(),
      ]),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        hintColor: Colors.red,
        primaryColor: Colors.amberAccent,
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            color: Colors.blue,
          ),
          labelStyle: TextStyle(
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
