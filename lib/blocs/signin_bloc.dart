// sign_in_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_plant/blocs/envent/signin_event.dart';
import 'package:project_plant/blocs/state/signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInWithEmailPasswordEvent>(_onSignInWithEmailPassword);
    on<SignInWithGoogleEvent>(_onSignInWithGoogle);
  }

  Future<void> _onSignInWithEmailPassword(
    SignInWithEmailPasswordEvent event,
    Emitter<SignInState> emit,
  ) async {
    try {
      emit(SignInLoading());
      // Implement your authentication logic here
      // Example:
      // await authRepository.signInWithEmailPassword(
      //   email: event.email,
      //   password: event.password,
      // );
      emit(SignInSuccess());
    } catch (e) {
      emit(SignInFailure(e.toString()));
    }
  }

  Future<void> _onSignInWithGoogle(
    SignInWithGoogleEvent event,
    Emitter<SignInState> emit,
  ) async {
    try {
      emit(SignInLoading());
      // Implement Google Sign-In logic here
      // Example:
      // await authRepository.signInWithGoogle();
      emit(SignInSuccess());
    } catch (e) {
      emit(SignInFailure(e.toString()));
    }
  }
}
