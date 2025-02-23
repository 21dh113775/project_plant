import 'package:flutter/material.dart';
import 'package:project_plant/ui/screens/signin_page.dart';
import 'ui/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => SignIn(),
      },
      title: 'Onboarding Screen',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          toolbarHeight: 0, // Đặt chiều cao toolbar về 0
        ),
      ),
      home: OnboardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
