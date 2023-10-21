import 'package:flutter/material.dart';
import 'package:forum_api/app/modules/feed/controllers/feed_controller.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../feed/views/widgets/post_data.dart';
import '../../feed/views/widgets/post_field.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final feedC = Get.put(FeedController());
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
              Obx(() => feedC.isLoading.value
                ? Center(
                  child: CircularProgressIndicator(),
                )
                : ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: feedC.feeds.value.length,
                  itemBuilder: (context, index) {
                    return PostData(
                      feed: feedC.feeds.value[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
