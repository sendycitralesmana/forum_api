import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';
import 'widgets/post_data.dart';
import 'widgets/post_field.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var token = controller.box.read('token');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forum'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PostField(),
              Text('Posts'),
              SizedBox(
                height: 20,
              ),
              PostData(),
              PostData(),
              PostData(),
              PostData(),
            ],
          ),
        ),
      ),
    );
  }
}
