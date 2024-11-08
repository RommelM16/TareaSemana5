class PcModel {
  int? id;
  String nombrePc;
  String procesador;
  String discoDuro;
  String ram;

  PcModel(
      {this.id,
      required this.nombrePc,
      required this.procesador,
      required this.discoDuro,
      required this.ram});

  // Convertir un objeto Computadora en un Map para SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombrePc': nombrePc,
      'procesador': procesador,
      'discoDuro': discoDuro,
      'ram': ram,
    };
  }

  // Crear un objeto Computadora a partir de un Map
  factory PcModel.fromMap(Map<String, dynamic> map) {
    return PcModel(
      id: map['id'],
      nombrePc: map['nombrePc'],
      procesador: map['procesador'],
      discoDuro: map['discoDuro'],
      ram: map['ram'],
    );
  }
}
