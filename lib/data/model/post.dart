import 'package:flutter_full_course/data/model/user.dart';

class Post {
  final int? id;
  final String? message;
  final User? owner;
  final DateTime? date;
  final String? image;

  Post(this.id, this.message, this.owner, this.date, this.image);

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        json['id'],
        json['message'],
        json['owner'] == null ? null : User.fromJson(json['owner']),
        json['date'] == null ? null : DateTime.parse(json['date']),
        json['image'],
      );
}
