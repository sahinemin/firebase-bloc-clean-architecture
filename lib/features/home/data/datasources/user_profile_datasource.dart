import 'package:firebase_auth/firebase_auth.dart';
import 'package:study/features/home/data/models/user_profile_model.dart';

abstract interface class UserProfileDataSource {
  Future<UserProfileModel?> getUserProfile({required User user});
  Future<void> createUserProfile({required UserProfileModel user});
  Future<void> addHobby({required String hobby, required String userUid});
}
