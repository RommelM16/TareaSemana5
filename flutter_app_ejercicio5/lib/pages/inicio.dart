import 'package:flutter/material.dart';

//Pantalla principal que utiliza StatefulWidget para permitir actualizaciones dinámicas.
class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage>
    with SingleTickerProviderStateMixin {
  //permite manejar animaciones

  //Variables de animación
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    //inicializa el controlador de animación y la animación de color.
    super.initState();

    // Inicializa el AnimationController
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500), // Duración de la animación
      vsync:
          this, //optimiza el rendimiento al prevenir el sobreconsumo de recursos,
    );

    // Crea un Tween para el color
    _colorAnimation = ColorTween(
      begin: Colors.white, // color inicial
      end: Colors.red, // Color final de la animación
    ).animate(_controller);

    // Inicia la animación y la repite
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose(); // Libera el controller
    super.dispose();
  }

  final TextStyle txtTituloEstilo = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28,
    fontFamily: 'RocknRoll One',
    color: Colors.amber,
  );

  final TextStyle txtParrafoEstilo = const TextStyle(
    fontSize: 14,
    fontFamily: 'RocknRoll One',
    color: Color.fromARGB(255, 13, 35, 53),
  );

  final TextStyle txtSubTituloEstilo = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    fontFamily: 'RocknRoll One',
    color: Color.fromARGB(255, 13, 35, 53),
  );

  final TextStyle txtBtnEstilo = const TextStyle(
    color: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Estructura básica que incluye un AppBar y un cuerpo central.
      appBar: AppBar(
        title: const Text(
          'Inicio',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text("Bienvenido a EsenTICs", style: txtTituloEstilo),
              const SizedBox(height: 10),
              Image.asset('images/1.png', width: 300),
              const SizedBox(height: 10),
              Text(
                "Transformamos tus ideas en soluciones tecnológicas. \nEn EsenTICs, nos especializamos en desarrollo de software a medida y soporte técnico integral. Nuestro compromiso es brindarte un servicio de calidad que impulse la innovación y optimice tus procesos.",
                textAlign: TextAlign.center,
                style: txtParrafoEstilo,
              ),
              const SizedBox(height: 20),
              AnimatedBuilder(
                animation: _colorAnimation,
                builder: (context, child) {
                  return Text(
                    "¡Descubre cómo podemos ayudarte a alcanzar tus objetivos!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'RocknRoll One',
                      color: _colorAnimation.value,
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, "Nosotros"),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.info,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 8),
                          Text("Nosotros", style: txtBtnEstilo),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, "Contactos"),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.contact_mail,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 8),
                          Text("Contactos", style: txtBtnEstilo),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 180,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, "Productos"),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.contact_mail,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 8),
                      Text("Computadoras", style: txtBtnEstilo),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "Login"),
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.person,
          size: 40,
          semanticLabel: "iniciar",
          color: Colors.blue,
        ),
      ),
    );
  }
}
