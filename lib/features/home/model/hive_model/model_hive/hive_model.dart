
import 'package:hive/hive.dart';
part 'hive_model.g.dart';


@HiveType(typeId: 1)
class HiveModel extends HiveObject{

  @HiveField(0)
  String title;


  @HiveField(1)
  String price;


  @HiveField(2)
  double productquantity;

  @HiveField(3)
  String thumbnail;

  HiveModel({ required this.title, required this.price, required this.productquantity, required this.thumbnail});

}