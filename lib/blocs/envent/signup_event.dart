abstract class SignupEvent {}

class SignupSubmitted extends SignupEvent {
  final String email;
  final String fullName;
  final String password;

  SignupSubmitted({
    required this.email,
    required this.fullName,
    required this.password,
  });
}
