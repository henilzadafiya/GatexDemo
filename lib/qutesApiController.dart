import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class QutesApiController extends GetxController{

 Future getHttp() async {
   var url = Uri.https('dummyjson.com','quotes');
   var response = await http.get(url);
   // log(response.body);
   if(response.statusCode == 200) {
     final Map<String, dynamic> data = jsonDecode(response.body);
     // log('${jsonEncode(data)}');
     // print(data['quotes']);
     return data;
   }
 }

}