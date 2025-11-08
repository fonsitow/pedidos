import 'package:flutter/material.dart';
import 'package:pedidos/screens/home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url:'https://mmoafjzrxpkosqdnvrdp.supabase.co',
    anonKey:'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1tb2FmanpyeHBrb3NxZG52cmRwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjE5OTkxMTUsImV4cCI6MjA3NzU3NTExNX0.d5TaKODASLSL5-qz1UG21By9uEYMDdE9b5Q4WJV6SsE',
  );
  runApp(MyApp());
}
// Get a reference your Supabase client
final supabase = Supabase.instance.client;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

ThemeData temaClaro = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blueAccent,
  cardColor: Colors.white70,
  scaffoldBackgroundColor: Colors.white,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.grey[200],
    hintStyle: TextStyle(color: Colors.grey[600]),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  ),
);

ThemeData temaOscuro = ThemeData(
  brightness: Brightness.dark,
  cardColor: Colors.white10,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.grey[900],
    hintStyle: TextStyle(color: Colors.grey[400]),
  ),
  primaryColor: Colors.blue.shade400,
  scaffoldBackgroundColor: const Color(0xFF0E1823),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color(0xFF0E1823),
    foregroundColor: Colors.white,
  ),
);

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    const String titulo = 'Pedidos YA';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: titulo,
      theme: temaClaro,
      darkTheme: temaOscuro,
      themeMode: ThemeMode.system,
      home: Home(titulo: titulo),
    );
  }
}
