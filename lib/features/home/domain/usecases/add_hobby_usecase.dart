import 'package:injectable/injectable.dart';
import 'package:study/core/usecase/usecase.dart';
import 'package:study/core/utils/typedef.dart';
import 'package:study/features/home/domain/repositories/user_profile_repository.dart';

@injectable
final class AddHobbyUseCase extends UseCase<void, AddHobbyUseCaseParams> {
  AddHobbyUseCase(this.repository);
  final UserProfileRepository repository;

  @override
  RemoteCallResult<void> call(AddHobbyUseCaseParams params) {
    return repository.addHobby(hobby: params.hobby, userUid: params.userUid);
  }
}

final class AddHobbyUseCaseParams {
  AddHobbyUseCaseParams({required this.hobby, required this.userUid});
  final String hobby;
  final String userUid;
}
