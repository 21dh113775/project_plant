import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_plant/blocs/envent/signin_event.dart';
import 'package:project_plant/blocs/state/signin_state.dart';
import 'package:project_plant/models/database/databaseHelper.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    // Đăng ký sự kiện và xử lý sự kiện
    on<SignInWithEmailPasswordEvent>((event, emit) async {
      emit(SignInLoading());

      try {
        // Lấy danh sách người dùng từ cơ sở dữ liệu
        final users = await DatabaseHelper.instance.getUsers();

        // Tìm người dùng với email và mật khẩu phù hợp
        final user = users.firstWhere(
          (user) =>
              user['email'] == event.email &&
              user['password'] == event.password,
          orElse: () =>
              {}, // Trả về một Map trống nếu không tìm thấy người dùng phù hợp
        );

        if (user.isNotEmpty) {
          // Nếu tìm thấy người dùng, trả về trạng thái thành công
          emit(SignInSuccess());
        } else {
          // Nếu không tìm thấy người dùng, trả về lỗi
          emit(SignInFailure(error: 'Invalid email or password'));
        }
      } catch (e) {
        // Bắt lỗi nếu có vấn đề trong quá trình truy vấn cơ sở dữ liệu
        emit(SignInFailure(error: 'An error occurred. Please try again'));
      }
    });

    // Đăng ký sự kiện đăng nhập với Google (nếu cần)
    on<SignInWithGoogleEvent>((event, emit) {
      // Xử lý đăng nhập với Google
    });
  }
}
