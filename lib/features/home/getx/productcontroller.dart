import 'package:get/get.dart';
import 'package:getx_task/features/home/model/hive_model/functions_hive/hive_functions.dart';
import 'package:getx_task/features/home/model/hive_model/model_hive/hive_model.dart';
import 'package:getx_task/features/home/network/apiservice.dart';
import 'package:getx_task/features/home/model/dio_model/model.dart';

class ProductController extends GetxController {
  var products = <FetchModel>[].obs;
  var cartItems = <HiveModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    fetchCartItems();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      products.value = await fetchData();
    } catch (e) {
      // Handle error
      print(e);
    }
  }

  Future<void> addToCart(HiveModel product) async {
    await addProduct(product);
    fetchCartItems();
    Get.snackbar('Success', 'Product added to cart!');
  }

  Future<void> fetchCartItems() async {
    cartItems.value = await getProduct().then((value) => value.toList());
  }

  Future<void> removeFromCart(HiveModel product) async {
    await product.delete();
    fetchCartItems();
    Get.snackbar('Success', 'Product removed from cart!');
  }
}
