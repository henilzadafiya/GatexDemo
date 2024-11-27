import 'package:get/get.dart';

class FavriteController extends GetxController {
  RxList<String> fruitList = ['Orange', 'Apple', 'Banana', 'Mangoes'].obs;
  RxList tempList = [].obs;

  addToFavrite(String value){
    tempList.add(value);
  }
  removeToFavrite(String value){
    tempList.remove(value);
  }
}
