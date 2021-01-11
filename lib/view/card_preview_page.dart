import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_test_app/controller/user_details_controller.dart';

class CardPreviewPage extends StatelessWidget {
  final user_details_controller = Get.find<UserDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/background.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
          child: Center(
            child: Column(
              children: [
                Obx(
                  () => CircleAvatar(
                    maxRadius: 80,
                    backgroundImage:
                        user_details_controller.profileImagePath == ""
                            ? AssetImage("assets/avatar.png")
                            : FileImage(File(user_details_controller
                                .profileImagePath
                                .toString())),
                  ),
                ),
                SizedBox(height: 15),
                Obx(
                  () => Text(
                    user_details_controller.first_name.toString() +
                        " " +
                        user_details_controller.last_name.toString(),
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Obx(() => Text(user_details_controller.profession.toString(),
                    style: TextStyle(fontSize: 20))),
                Obx(() => Text(user_details_controller.mobile.toString(),
                    style: TextStyle(fontSize: 20))),
                Obx(() => Text(user_details_controller.email.toString(),
                    style: TextStyle(fontSize: 20))),
                Obx(() => Text(user_details_controller.address.toString(),
                    style: TextStyle(fontSize: 20))),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
