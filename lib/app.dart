import 'package:flutter/material.dart';
import 'package:rachinha_top_app/pages/createAccount.dart';
import 'package:rachinha_top_app/pages/home.dart';
import 'package:rachinha_top_app/pages/profile.dart';
import 'package:rachinha_top_app/shared/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.index,
      routes: {
        AppRoutes.index: (ctx) => const HomePage(),
        AppRoutes.profile: (ctx) => const ProfileScreen(),
        AppRoutes.createAccount: (ctx) => const CreateAccountScreen(),
      },
    );
  }
}
