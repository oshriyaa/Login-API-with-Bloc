import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {


  @override
  List<Object> get props => [];
}

class CheckTokenEvent extends LoginEvent {}

class LoginPressedEvent extends LoginEvent {
  final String email;
  final String password;
   LoginPressedEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class LogoutPressedEvent extends LoginEvent {}
