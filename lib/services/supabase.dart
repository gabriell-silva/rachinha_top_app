import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> initializeSupabase() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Credenciais para inicializar o supabase
  await Supabase.initialize(
    url: 'https://jlagvparlkbnnvwejdga.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpsYWd2cGFybGtibm52d2VqZGdhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTMwNzExMDMsImV4cCI6MjAyODY0NzEwM30.uA33T4u1LsEiNcvhyHk67biVhSZc7DXfekRqZZhikDc',
  );
}
