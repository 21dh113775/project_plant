import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/envent/signup_event.dart';
import '../blocs/state/signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupSubmitted>(_onSignupSubmitted);
  }

  Future<void> _onSignupSubmitted(
      SignupSubmitted event, Emitter<SignupState> emit) async {
    emit(SignupLoading());
    try {
      // Giả lập việc đăng ký người dùng (có thể tích hợp API ở đây)
      await Future.delayed(const Duration(seconds: 2));

      // Kiểm tra dữ liệu (giả lập)
      if (event.email.isEmpty ||
          event.fullName.isEmpty ||
          event.password.isEmpty) {
        throw Exception("All fields are required.");
      }

      emit(SignupSuccess());
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }
}
