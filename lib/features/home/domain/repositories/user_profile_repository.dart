import 'package:firebase_auth/firebase_auth.dart';
import 'package:study/core/utils/typedef.dart';
import 'package:study/features/home/domain/entities/user_profile_entity.dart';

abstract interface class UserProfileRepository {
  RemoteCallResult<UserProfileEntity?> getUserProfile({
    required User user,
  });
  RemoteCallResult<void> createUserProfile({
    required UserProfileEntity userProfileEntity,
  });
  RemoteCallResult<void> addHobby({
    required String hobby,
    required String userUid,
  });
}
