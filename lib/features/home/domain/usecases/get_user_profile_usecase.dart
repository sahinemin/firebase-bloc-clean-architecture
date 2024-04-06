import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:study/core/usecase/usecase.dart';
import 'package:study/core/utils/typedef.dart';
import 'package:study/features/home/domain/entities/user_profile_entity.dart';
import 'package:study/features/home/domain/repositories/user_profile_repository.dart';

@injectable
final class GetUserProfileUseCase extends UseCase<UserProfileEntity?, User> {
  GetUserProfileUseCase(this.repository);
  final UserProfileRepository repository;

  @override
  RemoteCallResult<UserProfileEntity?> call(User params) {
    return repository.getUserProfile(user: params);
  }
}
