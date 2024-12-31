part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {}

class FullNameChangedEvent extends AuthEvent {
  final String name;
  FullNameChangedEvent({required this.name});
  @override
  List<Object?> get props => [name];
}

class UnfocusedFullNameEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class EmailChangedEvent extends AuthEvent {
  final String email;
  EmailChangedEvent({required this.email});
  @override
  List<Object?> get props => [email];
}

class UnfocusedEmailEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class PasswordChangedEvent extends AuthEvent {
  final String password;
  PasswordChangedEvent({required this.password});

  @override
  List<Object?> get props => [password];
}

class UnfocusedPasswordEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class LoginSubmitEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class RegisterSubmitEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  RegisterSubmitEvent({
    required this.name,
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => [name, email, password];
}
