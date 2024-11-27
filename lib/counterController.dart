import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt counter = 0.obs;
  TextEditingController a =TextEditingController();
  TextEditingController b =TextEditingController();
  sum(){
    counter.value = int.parse(a.text) + int.parse(b.text) ;
  }
  sub(){
    counter.value = int.parse(a.text) - int.parse(b.text) ;
  }
  muli(){
    counter.value = int.parse(a.text) * int.parse(b.text) ;
  }

  incrementCounter() {
    counter.value++;
  }

  decremetCounter() {
    counter.value--;
  }
}
