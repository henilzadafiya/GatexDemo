import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {

  Future fetchApi() async {
     var url = Uri.https('dummyjson.com', 'users');
     var response = await http.get(url);
     print(response.body);
     print("object");
     Map m = jsonDecode(response.body);
     print(m);
     return m;
   }
}