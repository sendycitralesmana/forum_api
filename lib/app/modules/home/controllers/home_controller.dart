import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final box = GetStorage();

  final String hintText = 'What do you want to ask';
  late TextEditingController content;

  final count = 0.obs;
  @override
  void onInit() {
    content = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    content.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
