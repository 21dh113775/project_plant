abstract class SignInEvent {}

class SignInWithEmailPasswordEvent extends SignInEvent {
  final String email;
  final String password;

  SignInWithEmailPasswordEvent({required this.email, required this.password});
}

class SignInWithGoogleEvent extends SignInEvent {
  // Sự kiện đăng nhập với Google (nếu bạn có tích hợp)
}
