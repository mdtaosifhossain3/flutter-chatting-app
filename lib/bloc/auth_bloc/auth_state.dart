part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final String name;
  final String email;
  final String password;
  final String message;
  final PostApiStatus postApiStatus;

  const AuthState(
      {this.email = '',
      this.password = '',
      this.postApiStatus = PostApiStatus.initial,
      this.message = '',
      this.name = ""});

  AuthState copyWith(
      {String? name,
      String? mail,
      String? pass,
      PostApiStatus? postApiStatus,
      String? message}) {
    return AuthState(
        name: name ?? this.name,
        email: mail ?? email,
        password: pass ?? password,
        postApiStatus: postApiStatus ?? this.postApiStatus,
        message: message ?? this.message);
  }

  @override
  List<Object?> get props => [email, password, postApiStatus, message, name];
}
