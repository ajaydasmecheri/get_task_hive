



import 'package:getx_task/features/home/model/hive_model/model_hive/hive_model.dart';
import 'package:hive/hive.dart';

// add 

Future<void> addProduct(HiveModel data) async {
  var userDB = await Hive.openBox<HiveModel>("ProductBox");
   userDB.add(data);
}


// Get function
Future<Iterable<HiveModel>> getProduct() async {
  var userDB = await Hive.openBox<HiveModel>("ProductBox");
  return userDB.values;
}