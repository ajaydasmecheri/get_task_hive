import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_task/features/home/model/hive_model/model_hive/hive_model.dart';
import 'package:getx_task/features/home/getx/productcontroller.dart';

import 'package:input_quantity/input_quantity.dart';

class Detailsscreen extends StatelessWidget {
  final String image;
  final String title;
  final String price;

  const Detailsscreen({super.key, required this.image, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();
    double productQuantity = 1.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Info"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(image),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 3),
            ),
            Text(
              "₹ $price",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            InputQty(
              maxVal: 100,
              initVal: 1,
              minVal: 0,
              steps: 1,
              onQtyChanged: (val) {
                productQuantity = val;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                HiveModel data = HiveModel(
                  thumbnail: image,
                  title: title,
                  price: price,
                  productquantity: productQuantity,
                );
                productController.addToCart(data);
              },
              child: const Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
