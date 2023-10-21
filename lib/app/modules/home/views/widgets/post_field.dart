import 'package:flutter/material.dart';
import 'package:forum_api/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class PostField extends GetView<HomeController> {
  const PostField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: controller.content,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: controller.hintText,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              )
            ),
          ),
        ),
        ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
              onPressed: () {},
              child: Text("Post"),
            ),
            SizedBox(
              height: 30,
            ),
      ],
    );
  }
}
