import 'package:flutter/material.dart';
import 'package:rachinha_top_app/shared/app_routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> user =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final String? email = user['email'];
    final username = email?.split("@")[0];

    return Scaffold(
      appBar: AppBar(
        title: Text("Bem-vindo, $username"),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            },
            icon: const Icon(Icons.exit_to_app)),
      ),
      // drawer: AppDrawer(drawerItems: drawerItems),
      body: const Center(
        child: Text("Perfil de usuário"),
      ),
    );
  }
}
