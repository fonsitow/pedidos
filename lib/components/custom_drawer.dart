import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pedidos/core/estilos.dart';
import 'package:pedidos/main.dart';
import 'package:pedidos/screens/categorias.dart';
import 'package:pedidos/screens/clientes.dart';
import 'package:pedidos/screens/dashboard.dart';
import 'package:pedidos/screens/login.dart';
import 'package:pedidos/screens/productos.dart';
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
            trailing: Icon(Icons.home),
            onTap: () => Navegacion().paginas(DashboardPage(), context),
          ),
          const Divider(color: Color.fromARGB(255, 243, 33, 33)),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  ListTile(
                    leading: Image.asset('assets/images/clientes.png'),
                    title: Text('Clientes'),
                    onTap: () => Navegacion().paginas(ClientesPage(), context),
                  ),

                  ListTile(
                    leading: Image.asset('assets/images/categorias_.png'),
                    title: Text('Categorias'),
                    onTap: () => Navegacion().paginas(CategoriasPage(), context),
                  ),

                  ListTile(
                    leading: Image.asset('assets/images/productos_1.png'),
                    title: Text('Lista de productos'),
                    onTap: () => Navegacion().paginas(ProductosPage(), context),
                  ),

                  ListTile(
                    leading: Image.asset('assets/images/orden_1.png'),
                    title: Text('Orden de pedidos'),
                    onTap: () {},
                  ),

                  ListTile(
                    leading: Image.asset('assets/images/carrito_1.png'),
                    title: Text('Carrito de pedidos'),
                    onTap: () {},
                  ),

                  ListTile(
                    leading: Image.asset('assets/images/pedidos_1.png'),
                    title: Text('Historico de pedidos'),
                    onTap: () {},
                  ),
                  Divider(color: const Color.fromARGB(255, 243, 33, 33)),
                ],
              ),
            ),
          ),
          Divider(color: Colors.blue),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('cerrar sesion'),
            onTap: () async {
              try {
                await _client.auth.signOut();
                exit(0);
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
