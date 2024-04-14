import 'package:flutter/material.dart';
import 'package:rachinha_top_app/pages/createAccount.dart';
import 'package:rachinha_top_app/pages/home.dart';
import 'package:rachinha_top_app/pages/profile.dart';
import 'package:rachinha_top_app/shared/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key}); // props

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // remove flag debug
      initialRoute: AppRoutes.index, // class com rotas definidas
      routes: {
        AppRoutes.index: (ctx) => const HomeScreen(),
        AppRoutes.profile: (ctx) => const ProfileScreen(),
        AppRoutes.createAccount: (ctx) => const CreateAccountScreen(),
      },
    );
  }
}
