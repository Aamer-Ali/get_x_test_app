import 'package:get/get.dart';
import 'package:get_x_test_app/model/products.dart';

class ShoppingController extends GetxController {
  var products = List<Product>().obs;
  var data = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }

  void fetchData() {
    var apiResult = [
      Product(1, "Product 1", "Product 1 Image Url", "Product 1 Description",
          25.50),
      Product(2, "Product 2", "Product 2 Image Url", "Product 2 Description",
          50.00),
      Product(3, "Product 3", "Product 3 Image Url", "Product 3 Description",
          15.75),
    ];

    products.assignAll(apiResult);
  }
}
