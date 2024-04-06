import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:study/features/home/domain/entities/user_profile_entity.dart';
import 'package:study/features/home/domain/usecases/add_hobby_usecase.dart';
import 'package:study/features/home/domain/usecases/create_user_profile_usecase.dart';
import 'package:study/features/home/domain/usecases/get_user_profile_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
final class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this.getUserProfileUseCase,
    this.createUserProfileUseCase,
    this.addHobbyUseCase,
  ) : super(HomeInitial()) {
    on<GetUserProfileEvent>(
      (event, emit) async => getUserProfileEventHandler(emit, event),
    );
    on<CreateUserProfileEvent>(
      (event, emit) async => createUserProfileEventHandler(emit, event),
    );
    on<AddHobbyEvent>(
      (event, emit) async => addHobbyEventHandler(emit, event),
    );
    on<AddBirthDayEvent>(
      (event, emit) async => addBirthDayEventHandler(emit, event),
    );
    on<ClearUserProfileEvent>(
      (event, emit) async => emit(HomeInitial()),
    );
  }

  Future<void> addHobbyEventHandler(
    Emitter<HomeState> emit,
    AddHobbyEvent event,
  ) async {
    if (!event.formKey.currentState!.validate()) {
      return;
    }

    emit(HomeLoading());
    final result = await addHobbyUseCase.call(
      AddHobbyUseCaseParams(
        hobby: event.hobby,
        userUid: event.userProfileEntity.userUid,
      ),
    );

    result.fold((l) => emit(HomeFailure(l.message)), (r) {
      final currentUserProfile = event.userProfileEntity.copyWith(
        hobbies: List<String>.from(event.userProfileEntity.hobbies)
          ..add(event.hobby),
      );
      emit(HomeUserProfileLoaded(currentUserProfile));
    });
  }

  void addBirthDayEventHandler(
    Emitter<HomeState> emit,
    AddBirthDayEvent event,
  ) {
    emit(HomeLoading());
    dateOfBirthController = event.birthDay;
    emit(const EnterUserProfileInformation());
  }

  Future<void> createUserProfileEventHandler(
    Emitter<HomeState> emit,
    CreateUserProfileEvent event,
  ) async {
    if (!event.formKey.currentState!.validate()) {
      return;
    }
    emit(HomeLoading());
    final userProfileEntity = UserProfileEntity(
      userUid: user.uid,
      fullName: event.fullName,
      email: user.email!,
      birthDate: dateOfBirthController!,
      biography: event.biography,
      hobbies: const [],
    );
    final result = await createUserProfileUseCase(userProfileEntity);
    result.fold(
      (l) => emit(HomeFailure(l.message)),
      (r) => emit(HomeUserProfileLoaded(userProfileEntity)),
    );

    dateOfBirthController = null;
  }

  Future<void> getUserProfileEventHandler(
    Emitter<HomeState> emit,
    GetUserProfileEvent event,
  ) async {
    user = event.user;
    emit(HomeLoading());
    final userProfile = await getUserProfileUseCase(event.user);
    userProfile.fold((l) => emit(HomeFailure(l.message)), (r) {
      if (r == null) {
        emit(const EnterUserProfileInformation());
      } else {
        emit(HomeUserProfileLoaded(r));
      }
    });
  }

  late final User user;
  DateTime? dateOfBirthController;
  final AddHobbyUseCase addHobbyUseCase;
  final GetUserProfileUseCase getUserProfileUseCase;
  final CreateUserProfileUseCase createUserProfileUseCase;
}
