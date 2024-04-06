import 'package:injectable/injectable.dart';
import 'package:study/core/usecase/usecase.dart';
import 'package:study/core/utils/typedef.dart';
import 'package:study/features/home/domain/entities/user_profile_entity.dart';
import 'package:study/features/home/domain/repositories/user_profile_repository.dart';

@injectable
final class CreateUserProfileUseCase extends UseCase<void, UserProfileEntity> {
  CreateUserProfileUseCase(this.repository);
  final UserProfileRepository repository;

  @override
  RemoteCallResult<void> call(UserProfileEntity params) {
    return repository.createUserProfile(userProfileEntity: params);
  }
}
