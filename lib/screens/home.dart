import 'package:flutter/material.dart';
import 'package:pedidos/main.dart';
import 'package:pedidos/screens/dashboard.dart';
import 'package:pedidos/screens/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.titulo});

  final String titulo;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DashboardPage());
  }
}
