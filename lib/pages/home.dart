import 'package:flutter/material.dart';
import 'package:rachinha_top_app/services/supabase.dart';
import 'package:rachinha_top_app/shared/app_routes.dart';
import 'package:rachinha_top_app/widgtes/form/input.dart';
import 'package:rachinha_top_app/layout/drawer.dart';
import 'package:rachinha_top_app/widgtes/logo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late SupabaseClient client; // Cliente Supabase

  @override
  void initState() async {
    await initializeSupabase();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> authenticateUser() async {
    // Obter os valores dos campos
    String username = usernameController.text;
    String password = passwordController.text;

    try {
      // Fazer a requisição POST para o Supabase
      final response = await client.auth.signUp(
        username: username,
        password: password,
      );

      // Verificar se a requisição foi bem-sucedida
      if (response.error == null) {
        // Requisição bem-sucedida, redirecionar para outra tela, por exemplo
        Navigator.pushNamed(context, AppRoutes.profile);
      } else {
        // Requisição falhou, exibir mensagem de erro
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Erro de Autenticação'),
            content: Text('Erro: ${response.error!.message}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (error) {
      // Exibir mensagem de erro genérica em caso de exceção
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Erro'),
          content: Text('Ocorreu um erro: $error'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
        width: size.width,
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
              controller: usernameController,
            ),
            InputWidget(
              label: 'Senha',
              isPassword: true,
              controller: passwordController,
            ),
            ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue[900],
                foregroundColor: Colors.blue[100],
                minimumSize: const Size(300, 40),
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 22),
              ),
              child: const Text('Entrar'),
              onPressed: () {
                authenticateUser(); // Chamar a função de autenticação
              },
            ),
            TextButton(
              child: const Text('Criar Conta'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.createAccount);
              },
            ),
          ],
        ),
      ),
    );
  }
}
