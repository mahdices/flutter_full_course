import 'package:flutter_full_course/data/model/post.dart';
import 'package:flutter_full_course/data/service/base_service.dart';

class CreatePostService extends ServiceBase<void> {
  final String message;
  final String? image;
  final String token;

  CreatePostService(this.message, this.image, this.token);

  @override
  Future<void> call() async {
    final body = {
      'message': message,
    };
    if (image != null) {
      body['image'] = image!;
    }
    await post('post', body: body, token: token);
  }
}
