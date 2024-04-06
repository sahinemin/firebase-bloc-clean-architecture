import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:study/features/home/data/datasources/user_profile_datasource.dart';
import 'package:study/features/home/data/models/user_profile_model.dart';

@LazySingleton(as: UserProfileDataSource)
final class FirebaseUserProfileDataSource implements UserProfileDataSource {
  FirebaseUserProfileDataSource() {
    _firebaseFirestore = FirebaseFirestore.instance;
  }

  late final FirebaseFirestore _firebaseFirestore;

  @override
  Future<UserProfileModel?> getUserProfile({
    required User user,
  }) async {
    final result =
        await _firebaseFirestore.collection('userProfiles').doc(user.uid).get();

    if (!result.exists || result.data() == null) {
      return null;
    }

    return UserProfileModel.fromJson(result.data()!);
  }

  @override
  Future<void> createUserProfile({required UserProfileModel user}) async {
    await _firebaseFirestore
        .collection('userProfiles')
        .doc(user.userUid)
        .set(user.toJson());
  }

  @override
  Future<void> addHobby(
      {required String hobby, required String userUid,}) async {
    await _firebaseFirestore.collection('userProfiles').doc(userUid).update(
      {
        'hobbies': FieldValue.arrayUnion([hobby]),
      },
    );
  }
}
