import 'dart:convert';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PostController extends GetxController {
  // Future getHttp() async {
  //   var url = Uri.https('dummyjson.com', 'posts');
  //   final response = await http.get(url).catchError((error) {
  //     throw Text("no internet");
  //   });
  //   if (response.statusCode == 200) {
  //     try {
  //       final Map<String, dynamic> data = json.decode(response.body);
  //       log("-----${data}");
  //       if (data != null) return data;
  //     }
  //     catch (e) {
  //       throw Text("error ${e.toString()}");
  //     }
  //   }
  //
  // }
    Future getHttp() async {
        var url = Uri.parse('http://192.168.39.173/api/create.php');
        var response = await http.post(url,body: {
        'name' : 'henil',
        'contact' : '7777913837',
        'city' : 'surat'
        });
        print(response.statusCode);
    }
}
