import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_task/features/home/getx/productcontroller.dart';

class Shoppingcart extends StatelessWidget {
  const Shoppingcart({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Obx(() {
        if (productController.cartItems.isEmpty) {
          return const Center(child: Text('No products in cart.'));
        }
        return ListView.builder(
          itemCount: productController.cartItems.length,
          itemBuilder: (context, index) {
            final product = productController.cartItems[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.network(product.thumbnail),
                        ),
                        Text(
                          product.title,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text('Price: ₹${product.price}'),
                        Text('Qty: ${product.productquantity}'),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        productController.removeFromCart(product);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
