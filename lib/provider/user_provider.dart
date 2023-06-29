import 'package:flutter/material.dart';
import 'package:flutter_full_course/data/model/user.dart';
import 'package:flutter_full_course/data/service/get_all_user_service.dart';

class UserProvider extends ChangeNotifier {
  Future<List<User>> getAllUser() async {
    return await GetAllUserService().call();
  }
}
