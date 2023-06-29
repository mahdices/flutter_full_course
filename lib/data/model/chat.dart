import 'package:flutter_full_course/data/model/user.dart';

class Chat {
  final String message;
  final User user;

  Chat(this.message, this.user);

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        json['message'],
        User.fromJson(
          json['user'],
        ),
      );
}
