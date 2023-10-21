import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
   HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var token = controller.box.read('token');
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          token,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
