import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forum_api/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;

  var hidden = true.obs;
  final isLoading = false.obs;
  final token = ''.obs;
  final box = GetStorage();

  void dialogError(String msg) {
    Get.defaultDialog(
      title: "Pemberitahuan",
      middleText: msg,
    );
  }

  void login({String? email, password}) async {
    String url = 'http://172.17.176.1:80/api/';

    try {
      isLoading.value = true;

      var data = {
        'email': email,
        'password': password,
      };

      var response = await http.post(Uri.parse(url + 'user/login'),
          headers: {'Accept': 'application/json'}, body: data);

      if (response.statusCode == 200) {
        isLoading.value = false;
        token.value = jsonDecode(response.body)['token'];
        box.write('token', token.value);
        Get.offAndToNamed(Routes.HOME);
      } else {
        isLoading.value = false;
        print(jsonDecode(response.body));
        dialogError(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
