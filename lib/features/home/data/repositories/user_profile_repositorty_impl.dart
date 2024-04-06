import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:study/core/utils/typedef.dart';
import 'package:study/features/home/data/datasources/user_profile_datasource.dart';
import 'package:study/features/home/data/models/user_profile_model.dart';
import 'package:study/features/home/domain/entities/user_profile_entity.dart';
import 'package:study/features/home/domain/repositories/user_profile_repository.dart';

@LazySingleton(as: UserProfileRepository)
@immutable
final class UserProfileRepositoryImpl implements UserProfileRepository {
  const UserProfileRepositoryImpl({required this.userProfileDataSource});

  final UserProfileDataSource userProfileDataSource;

  @override
  RemoteCallResult<UserProfileEntity?> getUserProfile({
    required User user,
  }) async {
    return RemoteRequest.makeRequest(
      () => userProfileDataSource.getUserProfile(
        user: user,
      ),
      'Get User Profile Request',
    );
  }

  @override
  RemoteCallResult<void> createUserProfile({
    required UserProfileEntity userProfileEntity,
  }) {
    return RemoteRequest.makeRequest(
      () => userProfileDataSource.createUserProfile(
        user: UserProfileModel.fromEntity(userProfileEntity),
      ),
      'Create User Profile Request',
    );
  }

  @override
  RemoteCallResult<void> addHobby({
    required String hobby,
    required String userUid,
  }) {
    return RemoteRequest.makeRequest(
      () => userProfileDataSource.addHobby(
        hobby: hobby,
        userUid: userUid,
      ),
      'Add Hobby Request',
    );
  }
}
