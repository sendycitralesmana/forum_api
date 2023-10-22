import 'package:flutter/material.dart';
import 'package:forum_api/app/data/models/feed_model.dart';
import 'package:forum_api/app/modules/comment/views/widgets/post_detail.dart';
import 'package:forum_api/app/modules/feed/controllers/feed_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PostData extends GetView<FeedController> {
  const PostData({
    super.key,
    required this.feed
  });

  final FeedModel feed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              feed.user.name,
              style: GoogleFonts.poppins(),
            ),
            Text(
              feed.user.email,
              style: GoogleFonts.poppins(
                fontSize: 12
              ),
            ),
            SizedBox(height: 10,),
            Text(
              feed.content,  
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {}, 
                  icon: Icon(Icons.thumb_up),
                ),
                IconButton(
                  onPressed: () {
                    Get.to(PostDetail(feed: feed));
                  }, 
                  icon: Icon(Icons.message),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}