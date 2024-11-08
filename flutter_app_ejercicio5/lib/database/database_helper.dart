import 'package:sqflite/sqflite.dart';

/// Clase para la gestión de la base de datos utilizando el paquete sqflite.
class DatabaseHelper {
  // Instancia singleton de DatabaseHelper.
  static DatabaseHelper? _databaseHelper;

  /// Constructor privado para implementar el patrón singleton.
  DatabaseHelper._internal();

  /// Devuelve la instancia única de DatabaseHelper.
  /// Si no existe, se crea una nueva instancia.
  static DatabaseHelper get instance =>
      _databaseHelper ??= DatabaseHelper._internal();

  // Instancia de la base de datos.
  Database? _db;

  /// Getter que devuelve la instancia de la base de datos.
  /// Asume que la base de datos ya ha sido inicializada.
  Database get db => _db!;

  /// Método para inicializar la base de datos.
  /// Abre la base de datos existente o crea una nueva si no existe.
  /// También define la estructura de la tabla `computadoras` al momento de la creación.
  Future<void> init() async {
    _db = await openDatabase(
      'database.db', // Nombre del archivo de la base de datos.
      version: 1, // Versión de la base de datos.
      onCreate: (db, version) {
        // Definición de la tabla `computadoras`.
        db.execute('''
          CREATE TABLE computadoras (
            id INTEGER PRIMARY KEY AUTOINCREMENT, // Identificador único para cada registro.
            nombrePc TEXT NOT NULL,              // Nombre de la computadora (obligatorio).
            procesador TEXT NOT NULL,            // Tipo de procesador (obligatorio).
            discoDuro TEXT NOT NULL,             // Capacidad del disco duro (obligatorio).
            ram TEXT NOT NULL                    // Capacidad de la memoria RAM (obligatorio).
          )
        ''');
      },
    );
  }
}
