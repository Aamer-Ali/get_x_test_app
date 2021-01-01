import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_x_test_app/controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shoppingController = Get.put(ShoppingController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Text(controller.products[index].productName),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
