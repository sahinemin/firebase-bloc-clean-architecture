import 'package:equatable/equatable.dart';

class UserProfileEntity extends Equatable {
  const UserProfileEntity({
    required this.userUid,
    required this.fullName,
    required this.email,
    required this.birthDate,
    required this.biography,
    required this.hobbies,
  });
  //create empty contstructor
  UserProfileEntity.empty({required this.userUid})
      : fullName = 'Emin',
        email = 'sahin.emin2344@gmail.com',
        birthDate = DateTime.now(),
        biography = 'I am a software developer. I love to play games.',
        hobbies = const ['Football', 'Basketball', 'Volleyball'];
  final String userUid;
  final String fullName;
  final String email;
  final DateTime birthDate;
  final String biography;
  final List<String> hobbies;
  UserProfileEntity copyWith({
    String? fullName,
    String? email,
    DateTime? birthDate,
    String? biography,
    List<String>? hobbies,
  }) {
    return UserProfileEntity(
      userUid: userUid,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      birthDate: birthDate ?? this.birthDate,
      biography: biography ?? this.biography,
      hobbies: hobbies ?? this.hobbies,
    );
  }

  @override
  String toString() {
    return '''UserProfileEntity(userUid: $userUid, fullName: $fullName, email: $email, birthDate: $birthDate, biography: $biography, hobbies: $hobbies)''';
  }

  @override
  List<Object?> get props => [fullName, email, birthDate, biography, hobbies];
}
