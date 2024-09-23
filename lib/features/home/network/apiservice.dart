import 'package:dio/dio.dart';
import 'package:getx_task/features/home/model/dio_model/model.dart';

Future<List<FetchModel>> fetchData() async {
  final dio = Dio();
  final response = await dio.get('https://dummyjson.com/products?limit=50&skip=19');
  
  List<FetchModel> products = (response.data['products'] as List)
      .map((product) => FetchModel.fromJson(product))
      .toList();
  
  return products;
}