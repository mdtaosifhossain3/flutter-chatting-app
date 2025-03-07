import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sampark/config/routes/routes_name.dart';
import 'package:sampark/models/user_model.dart';
import '../../utils/enums.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<FullNameChangedEvent>(_onFullNameChanged);
    on<EmailChangedEvent>(_onEmailChanged);
    on<PasswordChangedEvent>(_onPasswordChanged);

    on<RegisterSubmitEvent>(_onRegisterButtonHit);
    on<LoginSubmitEvent>(_onLoginButtonHit);
  }
//Full Name Changed
  void _onFullNameChanged(FullNameChangedEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(name: event.name));
  }

//Email Changed
  void _onEmailChanged(EmailChangedEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(mail: event.email));
  }

  //Password Changed
  void _onPasswordChanged(PasswordChangedEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(pass: event.password));
  }

  //Register Button Hit
  void _onRegisterButtonHit(
      RegisterSubmitEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));
    final instance = FirebaseAuth.instance;

    try {
      var cred = await instance.createUserWithEmailAndPassword(
          email: state.email, password: state.password);

      if (cred.user != null) {
        //Update DisplayName
        await FirebaseAuth.instance.currentUser!.updateDisplayName(state.name);
        //UserMode
        var model = UserModel(
            id: FirebaseAuth.instance.currentUser!.uid,
            name: state.name,
            email: state.email,
            phone: "",
            photoURL: "",
            status: "",
            createdAt: DateTime.now(),
            lastActive: DateTime.now(),
            about: 'I am the ghost');
        // Create an user Collection
        await FirebaseFirestore.instance
            .collection("users")
            .doc(cred.user!.uid)
            .set(model.toJson());

        Get.offAllNamed(RoutesName.homeView);

        emit(state.copyWith(
            postApiStatus: PostApiStatus.success)); // Emit success state
      }
    } on TimeoutException {
      emit(state.copyWith(
          postApiStatus: PostApiStatus.error, message: "Time Out"));
    } on SocketException {
      emit(state.copyWith(
          postApiStatus: PostApiStatus.error, message: "No Internet"));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(state.copyWith(
            postApiStatus: PostApiStatus.error,
            message: "The account already exists for that email."));
      } else if (e.code == 'invalid-email') {
        emit(state.copyWith(
            postApiStatus: PostApiStatus.error,
            message: "The email address is not valid."));
      } else {
        emit(state.copyWith(
            postApiStatus: PostApiStatus.error,
            message: "An error occurred. Please try again."));
      }
    } catch (e) {
      emit(state.copyWith(
          postApiStatus: PostApiStatus.error,
          message: "Something went wrong. Please try again later."));
    }
  }

  //Login Button Hit
  void _onLoginButtonHit(
      LoginSubmitEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));
    final instance = FirebaseAuth.instance;

    try {
      var cred = await instance.signInWithEmailAndPassword(
          email: state.email, password: state.password);

      if (cred.user != null) {
        Get.offAllNamed(RoutesName.homeView);

        emit(state.copyWith(
            postApiStatus: PostApiStatus.success)); // Emit success state
      }
    } on TimeoutException {
      emit(state.copyWith(
          postApiStatus: PostApiStatus.error, message: "Time Out"));
    } on SocketException {
      emit(state.copyWith(
          postApiStatus: PostApiStatus.error, message: "No Internet"));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(state.copyWith(
            postApiStatus: PostApiStatus.error,
            message: "No user found for that email."));
      } else if (e.code == 'invalid-credential') {
        emit(state.copyWith(
            postApiStatus: PostApiStatus.error,
            message: "Invalid Email or Password."));
      } else if (e.code == 'wrong-password') {
        emit(state.copyWith(
            postApiStatus: PostApiStatus.error,
            message: "Incorrect password."));
      } else if (e.code == 'invalid-email') {
        emit(state.copyWith(
            postApiStatus: PostApiStatus.error,
            message: "Invalid email address."));
      } else if (e.code == 'user-disabled') {
        emit(state.copyWith(
            postApiStatus: PostApiStatus.error,
            message: "User account has been disabled."));
      } else if (e.code == 'too-many-requests') {
        emit(state.copyWith(
            postApiStatus: PostApiStatus.error,
            message: "Too many attempts. Try again later."));
      } else {
        emit(state.copyWith(
            postApiStatus: PostApiStatus.error,
            message: "An error occurred. Please try again."));
      }
    } catch (e) {
      emit(state.copyWith(
          postApiStatus: PostApiStatus.error,
          message: "Something went wrong. Please try again later."));
    }
  }
}
