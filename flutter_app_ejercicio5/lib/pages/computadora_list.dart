import 'package:flutter/material.dart';
import 'package:flutter_app_ejercicio3/database/pc_dao.dart';
import 'package:flutter_app_ejercicio3/models/pc_model.dart';
import 'computadora_form.dart';

/// Esta clase representa la pantalla principal que muestra una lista de computadoras
/// registradas en la base de datos. Permite agregar, editar y eliminar registros.
class ComputadoraList extends StatefulWidget {
  const ComputadoraList({super.key});

  @override
  State<ComputadoraList> createState() => _ComputadoraListState();
}

class _ComputadoraListState extends State<ComputadoraList> {
  // Variable que almacena una futura lista de objetos PcModel.
  late Future<List<PcModel>> computadoras;

  @override
  void initState() {
    super.initState();
    // Inicializa la lista de computadoras desde la base de datos.
    computadoras = PcDao().readAllPc();
  }

  /// Método para refrescar la lista de computadoras después de realizar operaciones
  /// como agregar, editar o eliminar. Vuelve a cargar los datos desde la base de datos.
  void _refreshList() {
    setState(() {
      computadoras = PcDao().readAllPc();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Computadoras'),
      ),
      // Utiliza FutureBuilder para manejar la carga asíncrona de datos.
      body: FutureBuilder<List<PcModel>>(
        future: computadoras,
        builder: (context, snapshot) {
          // Muestra un indicador de carga mientras se obtienen los datos.
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } 
          // Maneja cualquier error que ocurra al obtener los datos.
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } 
          // Caso cuando no hay computadoras registradas.
          else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text('No hay computadoras registradas.'));
          } 
          // Si hay datos disponibles, los muestra en una lista.
          else {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final pc = snapshot.data![index];
                return ListTile(
                  // Muestra el nombre de la computadora.
                  title: Text(
                    pc.nombrePc,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: 'RocknRoll One',
                    ),
                  ),
                  // Muestra el procesador, la RAM y el disco duro en el subtítulo.
                  subtitle: Text(
                    'PROCESADOR: ${pc.procesador}\nRAM: ${pc.ram}\nDisco: ${pc.discoDuro}',
                    style: const TextStyle(fontSize: 12),
                  ),
                  // Añade botones para editar y eliminar.
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Botón para editar la computadora.
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          // Navega a la pantalla de edición.
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ComputadoraForm(
                                computadora: pc,
                                onSaved: _refreshList,
                              ),
                            ),
                          );
                        },
                      ),
                      // Botón para eliminar la computadora.
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          // Elimina la computadora de la base de datos.
                          await PcDao().deletePc(pc.id!);
                          _refreshList(); // Refresca la lista tras la eliminación.
                        },
                      ),
                    ],
                  ),
                );
              },
              // Añade un separador entre los elementos de la lista.
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            );
          }
        },
      ),
      // Botón flotante para agregar una nueva computadora.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navega a la pantalla de creación de una nueva computadora.
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ComputadoraForm(
                onSaved: _refreshList,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
