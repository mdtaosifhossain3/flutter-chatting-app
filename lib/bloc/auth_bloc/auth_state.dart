part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final String message;
  final PostApiStatus postApiStatus;

  const AuthState(
      {this.postApiStatus = PostApiStatus.initial, this.message = ''});

  AuthState copyWith(
      {String? name,
      String? mail,
      String? pass,
      PostApiStatus? postApiStatus,
      String? message}) {
    return AuthState(
        postApiStatus: postApiStatus ?? this.postApiStatus,
        message: message ?? this.message);
  }

  @override
  List<Object?> get props => [postApiStatus, message];
}
