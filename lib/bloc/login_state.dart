import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_bloc/model/profile_data.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends LoginState {}

class LoggedInState extends LoginState {
  final UserProfile? profileData;
  LoggedInState({required this.profileData});

  @override
  List<Object?> get props => [profileData];
}

class LoggedOutState extends LoginState {}

class LoginErrorState extends LoginState {
  final String? message;
  LoginErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
