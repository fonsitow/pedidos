import 'package:flutter/material.dart';
import 'package:pedidos/components/custom_app_bar.dart';
import 'package:pedidos/components/custom_drawer.dart';

class ClientesPage extends StatefulWidget {
  const ClientesPage({super.key});

  @override
  State<ClientesPage> createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}