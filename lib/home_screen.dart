import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gatexdemo/favrite_controller.dart';
import 'package:gatexdemo/post_controller.dart';
import 'package:gatexdemo/post_model.dart';
import 'package:gatexdemo/quest_modal.dart';
import 'package:gatexdemo/qutesApiController.dart';
import 'package:gatexdemo/user_controller.dart';
import 'package:gatexdemo/user_model.dart';
import 'package:get/get.dart';

import 'image_picker_controller.dart';
import 'login_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // PostController controller = Get.put(PostController());
  QutesApiController controller = Get.put(QutesApiController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getHttp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Get tutarioal')),
        body: Center(
          child: FutureBuilder(
            future: controller.getHttp(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                if (snapshot.hasData) {
                  Map<String, dynamic> m = snapshot.data as Map<String, dynamic>;
                  List data = m['quotes'];
                  print(m.keys);
                  print(data);
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text('${data[index]['quote']}'),
                          leading: Text('${data[index]['id']}'),
                          subtitle: Text('${data[index]['author']}'),
                        ),
                      );
                    },
                  );
                }else {
                  return Text("No Data");
                }
              }
            },
          ),
        )

        // post api in coma
        // FutureBuilder(
        //   future: controller.getHttp(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(child: CircularProgressIndicator());
        //     } else {
        //       if (snapshot.hasData) {
        //         Map<String ,dynamic> data = snapshot.data;
        //         log("messagemessage : ${data.keys}");
        //         List post = data['posts'];
        //         log('====${data}');
        //         return ListView.builder(
        //           itemCount: data.length, itemBuilder: (context, index) {
        //           return Card(child: ListTile(
        //             title: Text('${post[index]['title']}'),
        //             subtitle: Text('${post[index]['body']}'),
        //             leading: Text('${post[index]['reactions']['likes']}'),
        //           ),);
        //         },);
        //       } else {
        //         return Text("NO DATA");
        //       }
        //     }
        //   },
        // ),
        );
  }
}
