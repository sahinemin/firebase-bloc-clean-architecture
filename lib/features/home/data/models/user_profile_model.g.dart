// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    UserProfileModel(
      userUid: json['userUid'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      biography: json['biography'] as String,
      hobbies:
          (json['hobbies'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserProfileModelToJson(UserProfileModel instance) =>
    <String, dynamic>{
      'userUid': instance.userUid,
      'fullName': instance.fullName,
      'email': instance.email,
      'birthDate': instance.birthDate.toIso8601String(),
      'biography': instance.biography,
      'hobbies': instance.hobbies,
    };
