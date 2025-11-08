import 'package:flutter/material.dart';
import 'package:pedidos/screens/login.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.titulo});

  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPage(),
    );
  }
}
