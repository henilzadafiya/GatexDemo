import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SCrren one ')),
      body: Column(
        children: [
          TextButton(onPressed: () {
              Get.back();
          }, child: Text("go back "))
        ],
      ),
    );
  }
}
