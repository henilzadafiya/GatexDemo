import 'package:get/get.dart';

class ExampleThreeController extends GetxController {
  RxBool notification = false.obs;

  SetNotification(bool value) {
    notification.value = value;

  }
}
