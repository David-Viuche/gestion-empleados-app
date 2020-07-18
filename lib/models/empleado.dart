import 'dart:convert';

Empleado empleadoFromJson(String str) => Empleado.fromJson(json.decode(str));

String empleadoToJson(Empleado data) => json.encode(data.toJson());

class Empleado {
  Empleado({
    this.id,
    this.nombre,
    this.apellido,
    this.tipoIdentificacion,
    this.numeroIdentificacion,
    this.correo,
    this.fechaIngreso,
    this.salario,
    this.telefonos,
  });

  int id;
  String nombre;
  String apellido;
  String tipoIdentificacion;
  int numeroIdentificacion;
  String correo;
  String fechaIngreso;
  String salario;
  List<Telefono> telefonos;

  factory Empleado.fromJson(Map<String, dynamic> json) => Empleado(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        tipoIdentificacion: json["tipoIdentificacion"],
        numeroIdentificacion: json["numeroIdentificacion"],
        correo: json["correo"],
        fechaIngreso: json["fechaIngreso"],
        salario: json["salario"],
        telefonos: List<Telefono>.from(
            json["telefonos"].map((x) => Telefono.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "tipoIdentificacion": tipoIdentificacion,
        "numeroIdentificacion": numeroIdentificacion,
        "correo": correo,
        "fechaIngreso": fechaIngreso,
        "salario": salario,
        "telefonos": List<dynamic>.from(telefonos.map((x) => x.toJson())),
      };
}

class Telefono {
  Telefono({
    this.telefono,
  });

  String telefono;

  factory Telefono.fromJson(Map<String, dynamic> json) => Telefono(
        telefono: json["telefono"],
      );

  Map<String, dynamic> toJson() => {
        "telefono": telefono,
      };
}
