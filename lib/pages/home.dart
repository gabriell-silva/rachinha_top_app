import 'package:flutter/material.dart';
import 'package:rachinha_top_app/layout/drawer.dart';
import 'package:rachinha_top_app/shared/app_routes.dart';
import 'package:rachinha_top_app/widgets/errors.dart';
import 'package:rachinha_top_app/widgets/input.dart';
import 'package:rachinha_top_app/widgets/logo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final client = Supabase.instance.client;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> authenticateUser() async {
    String username = emailController.text;
    String password = passwordController.text;

    try {
      await client.auth.signInWithPassword(password: password, email: username);

      Navigator.pushNamed(context, AppRoutes.profile);
    } on AuthApiException catch (error) {
      showDialog(
          context: context,
          builder: (context) => ErrorDialog(
                error: error,
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LogoWidget(
          sourceImage: 'assets/images/logo.png',
          heightImage: 150.0,
          widthImage: 150.0,
        ),
        backgroundColor: Colors.blue[50],
      ),
      drawer: AppDrawer(drawerItems: drawerItems),
      body: Container(
        color: Colors.blue[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoWidget(
              sourceImage: 'assets/images/icon-192x192.png',
              heightImage: 60.0,
              widthImage: 60.0,
            ),
            InputWidget(
              label: 'Usuário',
              controller: emailController,
            ),
            InputWidget(
              label: 'Senha',
              isPassword: true,
              controller: passwordController,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    foregroundColor: Colors.blue[100],
                    minimumSize: const Size(300, 60),
                  ),
                  child: const Text('Entrar'),
                  onPressed: () {
                    authenticateUser();
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Não possui uma conta?"),
                TextButton(
                  child: const Text('Criar Conta'),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AppRoutes.createAccount);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}