import 'package:flutter/material.dart';
import 'package:rachinha_top_app/utils/app_routes.dart';
import 'package:rachinha_top_app/widgets/errors.dart';
import 'package:rachinha_top_app/widgets/input.dart';
import 'package:rachinha_top_app/widgets/logo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> authenticateUser() async {
    String email = emailController.text;
    String password = passwordController.text;

    try {
      await Supabase.instance.client.auth
          .signInWithPassword(password: password, email: email);

      Navigator.of(context).pushNamed(AppRoutes.index,
          arguments: {"email": emailController.text});
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
              label: 'Email',
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
                    Navigator.pushNamed(context, AppRoutes.signUp);
                  },
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.index,
                      arguments: {"email": "convidado"});
                },
                child: const Text("Entrar como convidado"))
          ],
        ),
      ),
    );
  }
}
