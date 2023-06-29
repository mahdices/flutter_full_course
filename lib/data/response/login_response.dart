import 'package:flutter_full_course/data/model/user.dart';

class LoginResponse {
  final User user;
  final String token;

  LoginResponse(this.user, this.token);
  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        User.fromJson(json),
        json['token'],
      );
}
