import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentController extends GetxController {
  late TextEditingController commentRequest;

  @override
  void onInit() {
    commentRequest = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    commentRequest.dispose();
    super.onClose();
  }
}
