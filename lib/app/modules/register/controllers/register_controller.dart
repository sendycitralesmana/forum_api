import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;

  var hidden = false.obs;
  final isLoading = false.obs;
  final token = ''.obs;
  final box = GetStorage();

  void dialogError(String msg) {
    Get.defaultDialog(
      title: "Pemberitahuan",
      middleText: msg,
    );
  }

  void register({String? name, email, password}) async {
    String url = 'http://172.17.176.1:80/api/';

    try {
      isLoading.value = true;

      var data = {
        'name': name,
        'email': email,
        'password': password,
      };

      var response = await http.post(Uri.parse(url + 'user/register'),
          headers: {'Accept': 'application/json'}, body: data);

      if (response.statusCode == 201) {
        isLoading.value = false;
        print(jsonDecode(response.body));
        token.value = jsonDecode(response.body)['token'];
        box.write('token', token.value);
        dialogError('Success Register');
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
    name = TextEditingController();
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
    name.dispose();
    email.dispose();
    password.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
