import 'location.dart';

class User {
  final int id;
  final String? firstname;
  final String? lastname;
  final String? mobile;
  final String? birthday;
  final String? gender;
  final bool? visibleGender;
  final Location? location;

  User(
    this.id,
    this.firstname,
    this.lastname,
    this.mobile,
    this.birthday,
    this.gender,
    this.visibleGender,
    this.location,
  );

  factory User.fromJson(Map<String, dynamic> json) => User(
        json['id'],
        json['firstname'],
        json['lastname'],
        json['mobile'],
        json['birthday'],
        json['gender'],
        json['visibleGender'],
        json['location'] != null ? Location.fromJson(json['location']) : null,
      );
}
