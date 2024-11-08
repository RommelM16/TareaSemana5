import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _username, _password, _email, _cellphone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrarse')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image.asset(
              'images/1.png',
              width: 200,
            ),
            const SizedBox(height: 20),
            Center(
              child: Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Campo de Usuario
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: 'Usuario',
                            border: UnderlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese su usuario';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _username = value;
                          },
                        ),
                        const SizedBox(height: 10),
                        // Campo de Clave
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.lock),
                            labelText: 'Clave',
                            border: UnderlineInputBorder(),
                          ),
                          obscureText:
                              true, // Oculta el texto para la contraseña
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese su clave';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _password = value;
                          },
                        ),
                        const SizedBox(height: 10),
                        // Campo de Correo Electrónico
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.mail),
                            labelText: 'Correo Electrónico',
                            border: UnderlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese su correo electrónico';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Por favor ingrese un correo válido';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _email = value;
                          },
                        ),
                        const SizedBox(height: 10),
                        // Campo de Celular
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.call),
                            labelText: 'Celular',
                            border: UnderlineInputBorder(),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese su número de celular';
                            }
                            if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                              return 'Por favor ingrese un celular válido (10 dígitos)';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _cellphone = value;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Botón de Registro
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              debugPrint('-Username: $_username\n'
                                  '-Password: $_password\n'
                                  '-Email: $_email\n'
                                  '-Cellphone: $_cellphone');
                            }
                          },
                          child: const Text(
                            'Registrarse',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
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
