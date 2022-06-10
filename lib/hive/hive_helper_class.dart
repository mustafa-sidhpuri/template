import 'package:hive/hive.dart';

class HiveHelperClass<T>{
  Box<T> box;
  HiveHelperClass({required this.box});

  addData(T value){
    box.add(value);
  }
  addWithKey(T value, String key){
    box.put(key, value);
  }

  updateValueWithKey(T value, String key){
    box.put(key, value);
  }

  deleteValue(String key){
    box.delete(key);
  }

}