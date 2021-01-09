import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_test_app/controller/shopping_controller.dart';

class CartPage extends StatelessWidget {
  // var controller = Get.find<ShoppingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text("${Get.arguments} === ${controller.data}"),
            Text("${Get.arguments} === "),
            RaisedButton(
              child: Text("Go to cart "),
              onPressed: () {
                // controller.data.value = 201;
                Get.back();
                // Get.back(result: "Pass data from here to previous screen");
              },
            )
          ],
        ),
      ),
    );
  }
}
