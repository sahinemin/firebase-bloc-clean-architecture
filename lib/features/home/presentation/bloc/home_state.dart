part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeFailure extends HomeState {
  const HomeFailure(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}

final class HomeUserProfileLoaded extends HomeState {
  const HomeUserProfileLoaded(this.userProfile);
  final UserProfileEntity userProfile;

  @override
  List<Object?> get props => [userProfile];
}

final class EnterUserProfileInformation extends HomeState {
  const EnterUserProfileInformation();

  @override
  List<Object?> get props => [];
}
