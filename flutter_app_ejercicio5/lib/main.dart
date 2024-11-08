import 'package:flutter/material.dart';
import 'package:flutter_app_ejercicio3/database/database_helper.dart';
import 'package:flutter_app_ejercicio3/pages/contactos.dart';
import 'package:flutter_app_ejercicio3/pages/inicio.dart';
import 'package:flutter_app_ejercicio3/pages/login.dart';
import 'package:flutter_app_ejercicio3/pages/nosotros.dart';
import 'package:flutter_app_ejercicio3/pages/computadora_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.init();
  runApp(const MyApp()); //Punto de entrada que inicializa la aplicación.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Configura el tema y las rutas.
      title: "EsenTICS",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute:
          "Inicio", //La propiedad initialRoute define la pantalla que se muestra al inicio.
      routes: {
        //Se difinen las rutas de navegación con sus respectivas páginas.
        "Inicio": (BuildContext context) => const InicioPage(),
        "Nosotros": (BuildContext context) => const NosotrosPage(),
        "Contactos": (BuildContext context) => const ContactosPage(),
        "Login": (BuildContext context) => const LoginPage(),
        "Productos": (BuildContext context) => const ComputadoraList(),
      },
    );
  }
}
