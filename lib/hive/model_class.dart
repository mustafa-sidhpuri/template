import 'package:hive/hive.dart';

part 'model_class.g.dart';

@HiveType(typeId: 0) // it should be always unique for each model
class ModelClass extends HiveObject{
  @HiveField(0)
  late String feature1;
  @HiveField(1)
  late String feature2;

}