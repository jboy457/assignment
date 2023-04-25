import 'package:assignment/utils/base_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      // body: Container(
      //   child: GetBuilder<PostsController>(
      //     builder: (controller) {
      //       return ListView.builder(
      //         itemCount: controller.postsList.length,
      //         itemBuilder: (context, index) => PostsListItem(
      //           post: controller.postsList[index],
      //         ),
      //       );
      //     },
      //   ),
      // ),
    );
  }
}
