import 'package:flutter/material.dart';
import 'package:forum_api/app/data/models/feed_model.dart';
import 'package:forum_api/app/modules/comment/controllers/comment_controller.dart';
import 'package:forum_api/app/modules/feed/views/widgets/post_data.dart';
import 'package:get/get.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({super.key, required this.feed, });

  final FeedModel feed;

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  final commentC = Get.put(CommentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.feed.user.name),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              PostData(
                feed: widget.feed
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 440,
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Text('Comment');
                  },
                ),
              ),
              TextField(
                controller: commentC.commentRequest,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Write a comment ...'
                ),
              ),
              ElevatedButton(
                onPressed: () {}, 
                child: Text('Comment'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 10,
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}