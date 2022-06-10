import 'package:hive/hive.dart';

import 'model_class.dart';

class Boxes {
  static Box<ModelClass> getModelClass() => Hive.box<ModelClass>("modelclass");
}