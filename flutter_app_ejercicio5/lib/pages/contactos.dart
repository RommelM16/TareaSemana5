import 'package:flutter/material.dart';

class ContactosPage extends StatefulWidget {
  const ContactosPage({super.key});
  @override
  State<ContactosPage> createState() => _ContactosPageState();
}

class _ContactosPageState extends State<ContactosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contactos',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.only(top: 20)),
            Image.asset(
              'images/s1.png',
              width: 200,
            ),
            //  const Padding(padding: EdgeInsets.only(top: 10)),
            const Text(
              "Contáctanos",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  fontFamily: 'RocknRoll One',
                  color: Colors.amber),
            ),
            const Text(
              "En EsenTICs estamos para ayudarte.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'RocknRoll One',
                color: Color.fromARGB(255, 13, 35, 53),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            Card.filled(
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const _CrearContacto(
                ciudad: 'Cuenca',
                direccion: 'Remigio Crespo 5-70',
                email: 'infocuenca@esentics',
                telefono: '09832355666',
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            Card.filled(
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const _CrearContacto(
                ciudad: 'Quito',
                direccion: 'Rumiñahui 5-70',
                email: 'infoquito@esentics',
                telefono: '09832355888',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.home,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class _CrearContacto extends StatelessWidget {
  const _CrearContacto({
    required this.ciudad,
    required this.direccion,
    required this.email,
    required this.telefono,
  });

  final String ciudad;
  final String direccion;
  final String email;
  final String telefono;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Column(
        children: [
          ListTile(
            title: Text(
              ciudad,
              style: const TextStyle(fontSize: 20),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _datosContacto(Icons.room, direccion, Colors.red),
                _datosContacto(Icons.mail, email, Colors.cyan),
                _datosContacto(Icons.call, telefono, Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _datosContacto(IconData icon, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
          ),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}
