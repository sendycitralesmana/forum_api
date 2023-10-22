import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:forum_api/app/data/models/feed_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class FeedController extends GetxController {
  Rx<List<FeedModel>> feeds = Rx<List<FeedModel>>([]);
  final isLoading = false.obs;
  final box = GetStorage();

  final String hintText = 'What do you want to ask';
  late TextEditingController content;
  String url = 'http://172.17.176.1:80/api/';

  void dialogInfo(String msg) {
    Get.defaultDialog(
      title: "Pemberitahuan",
      middleText: msg,
    );
  }

  Future getAllFeeds() async {
    try {
      isLoading.value = true;
      var response = await http.get(Uri.parse(url + 'feeds'),
      headers: {
        'Accept' : 'Application/json',
        'Authorization' : 'Bearer ${box.read('token')}',
      });
      if (response.statusCode == 200) {
        isLoading.value = false;
        for (var item in jsonDecode(response.body)['feeds']) {
          feeds.value.add(FeedModel.fromJson(item));
        }
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  Future createFeed({String? content}) async {
    try {
      // feeds.value.clear();
      var data = {
        'content' : content
      };

      var response = await http.post(
        Uri.parse(url + 'feed/store'),
        headers: {
        'Accept' : 'Application/json',
        'Authorization' : 'Bearer ${box.read('token')}',
        },
        body: data
      );

      if (response.statusCode == 200) {
        dialogInfo('Success create post');
      } else {
        dialogInfo(jsonDecode(response.body)['message']);
      }

    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    content = TextEditingController();
    getAllFeeds();
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

}
