import 'package:flutter/material.dart';
import 'package:pedidos/core/estilos.dart';
import 'package:pedidos/models/auth.dart';
import 'package:pedidos/screens/dashboard.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Get a reference your Supabase client
  final supabase = Supabase.instance.client;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  bool passwordVisible = true;

  void toggle() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  Future<Authentication> autenticacion() async {
    try {
      final response = await supabase.auth.signInWithPassword(
        password: passwordController.text,
        email: emailController.text,
      );

      final sesion = response.session!;
      final user = response.user!;

      return Authentication(
        id: user.id,
        accessToken: sesion.accessToken,
        tokenType: sesion.tokenType,
        userEmail: user.email.toString(),
      );
    } catch (ex) {
      debugPrint('ERROR: $ex');
      return Authentication(
        id: '',
        accessToken: '',
        tokenType: '',
        userEmail: '',
      );
    }
  }

  void navegacion() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DashboardPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 900,
          width: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            border: Border.all(color: Colors.black, width: 3),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              imagen(),
              titulo(),
              SizedBox(height: 24),
              usuario(context),
              password(context),
              SizedBox(height: 64),
              boton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget imagen() => Padding(
    padding: const EdgeInsets.only(),
    child: Image.asset(
      'assets/images/mylogin.png',
      height: 200,
      width: 200,
      fit: BoxFit.cover,
    ),
  );

  Widget titulo() => Padding(
    padding: const EdgeInsets.only(bottom: 32, top: 32),
    child: Text('Inicia Sesion', style: Styles().primary),
  );

  //USUARIO

  Widget usuario(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: TextField(
        controller: emailController,
        decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 24),
          label: Text('Email'),
          hint: Text('Ej patacon@gmail.com'),
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
      ),
    );
  }

  //PASSWORD

  Widget password(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: TextField(
        controller: passwordController,
        obscureText: passwordVisible,
        decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 24),
          label: Text('Contraseña'),
          hint: Text('12345678'),
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            onPressed: () {
              toggle();
            },
            icon: Icon(
              passwordVisible ? Icons.visibility : Icons.visibility_off,
            ),
          ),
          filled: true,
          fillColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
      ),
    );
  }

  Widget boton(BuildContext context) => Padding(
    padding: const EdgeInsets.all(32.0),
    child: ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Theme.of(context).primaryColor),
        foregroundColor: WidgetStatePropertyAll(
          Theme.of(context).appBarTheme.backgroundColor,
        ),
        elevation: WidgetStatePropertyAll(5),
      ),
      onPressed: () async {
        final loginUser = await autenticacion();

        if (context.mounted) {
          loginUser.accessToken.isNotEmpty
              ? navegacion()
              : ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Ingresa tus datos validos porfavor'),
                  ),
                );
        }
      },
      label: Text('Iniciar Sesion', style: TextStyle(fontSize: 32)),
      icon: Icon(Icons.login, size: 32),
    ),
  );
}
