import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
final class AuthenticationEntity extends Equatable {
  const AuthenticationEntity({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
