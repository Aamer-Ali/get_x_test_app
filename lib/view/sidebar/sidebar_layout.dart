import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_test_app/controller/shopping_controller.dart';
import 'package:get_x_test_app/controller/sidebar_controller.dart';
import 'package:get_x_test_app/view/pages/cart_page.dart';
import 'package:get_x_test_app/view/pages/shopping_page.dart';
import 'package:get_x_test_app/view/sidebar/sidebar.dart';

class SideBarlayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(
          children: [
            ShoppingPage(),
            SideBar(),
          ],
        ),
      );
  }
}
