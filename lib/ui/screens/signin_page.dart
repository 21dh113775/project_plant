import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_plant/blocs/envent/signin_event.dart';
import 'package:project_plant/blocs/signin_bloc.dart';
import 'package:project_plant/blocs/state/signin_state.dart';
import 'package:project_plant/constants.dart';
import 'package:project_plant/ui/root_page.dart';
import 'package:project_plant/ui/screens/forgot_pasword.dart';
import 'package:project_plant/ui/screens/signup_page.dart';
import 'package:project_plant/ui/screens/widgets/custom_textfied.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => SignInBloc(),
      child: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            Navigator.pushReplacement(
              context,
              PageTransition(
                child: const RootPage(),
                type: PageTransitionType.bottomToTop,
              ),
            );
          } else if (state is SignInFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/signin.png',
                        width: size.width * 0.6),
                    const SizedBox(height: 20),
                    const Text(
                      'Đăng Nhập',
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomTextfield(
                      controller: _emailController,
                      obscureText: false,
                      hintText: 'Nhập tài khoản Email',
                      icon: Icons.alternate_email,
                    ),
                    const SizedBox(height: 20),
                    CustomTextfield(
                      controller: _passwordController,
                      obscureText: true,
                      hintText: 'Nhập mật khẩu',
                      icon: Icons.lock,
                    ),
                    const SizedBox(height: 20),
                    if (state is SignInLoading)
                      const Center(child: CircularProgressIndicator())
                    else
                      GestureDetector(
                        onTap: () {
                          context.read<SignInBloc>().add(
                                SignInWithEmailPasswordEvent(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                        },
                        child: Container(
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Constants.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          child: const Center(
                            child: Text(
                              'Đăng Nhập',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            child: const ForgotPassword(),
                            type: PageTransitionType.bottomToTop,
                          ),
                        );
                      },
                      child: Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Forgot Password? ',
                                style: TextStyle(
                                  color: Constants.blackColor,
                                ),
                              ),
                              TextSpan(
                                text: 'Reset Here',
                                style: TextStyle(
                                  color: Constants.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: const [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('OR'),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        context.read<SignInBloc>().add(SignInWithGoogleEvent());
                      },
                      child: Container(
                        width: size.width * 0.9,
                        decoration: BoxDecoration(
                          border: Border.all(color: Constants.primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                              child: Image.asset('assets/images/google.png'),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Sign In with Google',
                              style: TextStyle(
                                color: Color.fromRGBO(43, 133, 218, 1),
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            child: const SignUp(),
                            type: PageTransitionType.bottomToTop,
                          ),
                        );
                      },
                      child: Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'New to Planty? ',
                                style: TextStyle(
                                  color: Constants.blackColor,
                                ),
                              ),
                              TextSpan(
                                text: 'Register',
                                style: TextStyle(
                                  color: Constants.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
