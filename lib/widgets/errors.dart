import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ErrorDialog extends StatelessWidget {
  final AuthException error;

  const ErrorDialog({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    final String customMessageError = teste(error);

    return AlertDialog(
      title: const Text('Error'),
      content: Text(customMessageError),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Tentar novamente'),
        ),
      ],
    );
  }
}

String teste(AuthException error) {
  switch (error.message) {
    case "Invalid login credentials":
      return "Credenciais de login inválidas";
    default:
      return "Outro tipo de erro";
  }
}
