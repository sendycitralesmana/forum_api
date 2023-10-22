import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forum_api/app/data/models/comment_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class CommentController extends GetxController {
  Rx<List<CommentModel>> comments = Rx<List<CommentModel>>([]);
  late TextEditingController commentRequest;

  final isLoading = false.obs;
  final box = GetStorage();
  String url = 'http://172.17.176.1:80/api/';

  void dialogInfo(String msg) {
    Get.defaultDialog(
      title: "Pemberitahuan",
      middleText: msg,
    );
  }

  Future getComments(id) async {
    try {
      comments.value.clear();
      isLoading.value = true;

      var response =
          await http.get(Uri.parse(url + 'comments/feed_id:$id'), headers: {
        'Accept': 'Application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      });

      if (response.statusCode == 200) {
        isLoading.value = false;
        final content = jsonDecode(response.body)['comments'];
        for (var item in content) {
          comments.value.add(CommentModel.fromJson(item));
        }
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
    }
  }

  Future createComment(id, body) async {
    try {
      isLoading.value = true;
      comments.value.clear();
      
      var data = {
        'body' : body
      };

      var response =
          await http.post(Uri.parse(url + 'comment/store/feed_id:$id'), headers: {
        'Accept': 'Application/json',
        'Authorization': 'Bearer ${box.read('token')}',
        },
        body: data
      );

      if (response.statusCode == 201) {
        isLoading.value = false;
        dialogInfo('Success comment');
      } else {
        isLoading.value = false;
        dialogInfo(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      print(e);
    }
  }

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
