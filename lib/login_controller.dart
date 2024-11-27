import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class LoginController extends GetxController {
  final emailControlller = TextEditingController().obs;
  final passwordControlller = TextEditingController().obs;

  RxBool loading = false.obs;

  Future<void> loginApi() async {
    loading.value = true;
    try {
      var url = Uri.parse('https://reqres.in/api/login');
      final response = await post(url, body: {
        'email': emailControlller.value.text,
        'password': passwordControlller.value.text
      });

      var data = jsonDecode(response.body);
      print(data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        loading.value = false;
        Get.snackbar('Login Successfully', 'Congratulation ');
      } else {
        loading.value = false;
        Get.snackbar('Login Failed', data['error']);
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar('Exacption', e.toString());
    }
  }
}
