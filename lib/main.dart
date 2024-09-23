import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_task/features/home/presentation/HomeScreen/homepage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:getx_task/features/home/model/hive_model/model_hive/hive_model.dart';

void main() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(HiveModelAdapter().typeId)) {
    Hive.registerAdapter(HiveModelAdapter());
  }
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
