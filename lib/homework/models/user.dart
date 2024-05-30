import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()

class  User {
  String avatar;
  String email;

  User({
    required this.avatar,
    required this.email,
  });

   factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }

}