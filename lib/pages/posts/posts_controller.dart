import 'package:get/get.dart';

import '../../models/post.dart';
import 'posts_provider.dart';

class PostsController extends GetxController {
  List<Post> postsList = [];
  bool isLoading = true;
  @override
  void onInit() {
    super.onInit();
  }
}
