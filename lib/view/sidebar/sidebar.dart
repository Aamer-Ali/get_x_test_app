import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_test_app/controller/sidebar_controller.dart';
import 'package:get_x_test_app/view/sidebar/menu_items.dart';

class SideBar extends StatelessWidget {
  var sideBarController = Get.put(SideBarController());

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    // ignore: dead_code
    return GetX<SideBarController>(builder: (controller) {
      return AnimatedPositioned(
        duration: Duration(milliseconds: 200),
        top: 30,
        bottom: 0,
        left: controller.isSideBarOpen.value ? 0 : -screenWidth,
        right: controller.isSideBarOpen.value ? 0 : screenWidth - 40,
        child: Scaffold(
          body: Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.amberAccent,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MenuItem("Shopping Page","/shopping"),
                        SizedBox(height: 50),
                        MenuItem("Cart Page","/carts"),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.999),
                child: Container(
                  width: 35,
                  height: 60,
                  color: Colors.amberAccent,
                  child: InkWell(
                      onTap: () {
                        if (sideBarController.isSideBarOpen.value == true) {
                          sideBarController.isSideBarOpen.value = false;
                        } else {
                          sideBarController.isSideBarOpen.value = true;
                        }
                        print(sideBarController.isSideBarOpen.value);
                      },
                      child: Icon(Icons.menu)),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
