import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pedidos/main.dart';
import 'package:pedidos/screens/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final SupabaseClient _client = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('User'),
            accountEmail: Text('ajhenriquez02@gmail.com'),
            decoration: BoxDecoration(color: Color(0x65000000)),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.supervised_user_circle_outlined, size: 72.8),
            ),
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/dashboard_1.png',
            ), //Parte trasera
            title: Text('Inicio'),
            onTap: () {},
          ),

          const Divider(color: Colors.blue),

          ListTile(
            leading: Image.asset('assets/images/clientes.png'),
            title: Text('Clientes'),
            onTap: () {},
          ),

          const Divider(color: Colors.blue),

          ListTile(
            leading: Image.asset('assets/images/categorias_.png'),
            title: Text('Categorias'),
            onTap: () {},
          ),

          const Divider(color: Colors.blue),

          ListTile(
            leading: Image.asset('assets/images/productos_1.png'),
            title: Text('Lista de productos'),
            onTap: () {},
          ),
          Divider(color: Colors.blue),
          ListTile(
            leading: Image.asset('assets/images/orden_1.png'),
            title: Text('Orden de pedidos'),
            onTap: () {},
          ),
          Divider(color: Colors.blue),
          ListTile(
            leading: Image.asset('assets/images/carrito_1.png'),
            title: Text('Carrito de pedidos'),
            onTap: () {},
          ),
          Divider(color: Colors.blue),
          ListTile(
            leading: Image.asset('assets/images/pedidos_1.png'),
            title: Text('Historico de pedidos'),
            onTap: () {},
          ),
          Spacer(),
          Divider(color: Colors.blue),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('cerrar sesion'),
            onTap: () async {
              try {
                await _client.auth.signOut();
                // exit(0);
                SystemNavigator.pop();
              } catch (e) {
                debugPrint('Ocurrio un error $e');
              }
            },
          ),
        ],
      ),
    );
  }
}
