import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_task/features/home/presentation/ProductInfoScreen/detailsScreen.dart';
import 'package:getx_task/features/home/getx/productcontroller.dart';
import 'package:getx_task/features/home/presentation/Cart/shoppingcart.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const Shoppingcart());
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Obx(() {
        if (productController.products.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            final product = productController.products[index];
            return GestureDetector(
              child: ListTile(
                leading: Image.network(product.thumbnail),
                title: Text(product.title),
                subtitle: Text('₹ ${product.price.toString()}'),
              ),
              onTap: () {
                Get.to(Detailsscreen(
                  image: product.thumbnail,
                  title: product.title,
                  price: product.price.toString(),
                ));
              },
            );
          },
        );
      }),
    );
  }
}
