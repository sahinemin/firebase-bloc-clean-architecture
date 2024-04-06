part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

@immutable
final class GetUserProfileEvent extends HomeEvent {
  const GetUserProfileEvent(this.user);
  final User user;
  @override
  List<Object> get props => [user];
}

@immutable
final class CreateUserProfileEvent extends HomeEvent {
  const CreateUserProfileEvent(this.fullName, this.biography, this.formKey);
  final String fullName;
  final String biography;
  final GlobalKey<FormState> formKey;
  @override
  List<Object> get props => [fullName, biography];
}

@immutable
final class AddHobbyEvent extends HomeEvent {
  const AddHobbyEvent(this.hobby, this.userProfileEntity, this.formKey);
  final String hobby;
  final UserProfileEntity userProfileEntity;
  final GlobalKey<FormState> formKey;
  @override
  List<Object> get props => [hobby];
}

@immutable
final class AddBirthDayEvent extends HomeEvent {
  const AddBirthDayEvent(this.birthDay);
  final DateTime birthDay;
  @override
  List<Object> get props => [birthDay];
}

@immutable
final class ClearUserProfileEvent extends HomeEvent {
  const ClearUserProfileEvent();
  @override
  List<Object> get props => [];
}
