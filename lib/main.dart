import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  final box = GetStorage();
  final token = box.read('token');
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: token == null
        ? Routes.LOGIN
        : Routes.HOME,
      getPages: AppPages.routes,
    ),
  );
}
