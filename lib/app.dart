import 'package:flutter/material.dart';
import 'package:rachinha_top_app/pages/login.dart';
import 'package:rachinha_top_app/pages/profile.dart';
import 'package:rachinha_top_app/pages/sign_up.dart';
import 'package:rachinha_top_app/shared/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (ctx) => const LoginPage(),
        AppRoutes.profile: (ctx) => const ProfilePage(),
        AppRoutes.signUp: (ctx) => const SignUpPage(),
      },
    );
  }
}
