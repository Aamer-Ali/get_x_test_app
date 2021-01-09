import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_x_test_app/controller/shopping_controller.dart';
import 'package:get_x_test_app/view/pages/cart_page.dart';

class ShoppingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shoppingController = Get.put(ShoppingController()); // <-- Initialized and memory allocated
    // Get.lazyPut(() => ShoppingController()); //<-- Memory is not allocated till we use that

    return GetMaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Text("Hello ${shoppingController.data}")),
                RaisedButton(
                  child: Text("Go to cart "),
                  onPressed: () {
                    // shoppingController.data.value = 101;
                    Get.to(CartPage(), arguments: "This is data"
                        // fullscreenDialog: true,
                        // transition: Transition.zoom,
                        // duration: Duration(milliseconds: 400),
                        );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
