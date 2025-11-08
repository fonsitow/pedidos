import 'package:flutter/material.dart';
import 'package:pedidos/components/custom_app_bar.dart';
import 'package:pedidos/components/custom_drawer.dart';
import 'package:pedidos/screens/categorias.dart';
import 'package:pedidos/screens/clientes.dart';
import 'package:pedidos/screens/pedidos.dart';
import 'package:pedidos/screens/productos.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBar(),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Text(
                  'Clientes',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Image.asset('assets/images/cliente.png'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ClientesPage()),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: ListTile(
                title: Text(
                  'Categorias',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Image.asset('assets/images/categorias_.png'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CategoriasPage()),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Text(
                  'Pedidos',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Image.asset('assets/images/pedidos_1.png'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PedidosPage()),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Text(
                  'Productos',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Image.asset('assets/images/productos_1.png'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductosPage()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        splashColor: Colors.red,
        elevation: 4,
        backgroundColor: Color(0x85FF0000),
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }
}
