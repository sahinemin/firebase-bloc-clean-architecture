import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:study/features/home/domain/entities/user_profile_entity.dart';

part 'user_profile_model.g.dart';

@immutable
@JsonSerializable()
final class UserProfileModel extends UserProfileEntity {
  const UserProfileModel({
    required super.userUid,
    required super.fullName,
    required super.email,
    required super.birthDate,
    required super.biography,
    required super.hobbies,
  });
  factory UserProfileModel.fromEntity(UserProfileEntity entity) {
    return UserProfileModel(
      userUid: entity.userUid,
      fullName: entity.fullName,
      email: entity.email,
      birthDate: entity.birthDate,
      biography: entity.biography,
      hobbies: entity.hobbies,
    );
  }
  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);
}
