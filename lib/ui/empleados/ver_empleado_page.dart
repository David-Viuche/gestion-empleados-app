import 'package:flutter/material.dart';
import 'package:gestion_empleados/models/empleado.dart';

// ignore: must_be_immutable
Empleado datosEmpleado = new Empleado();

class VerEmpleadoPage extends StatefulWidget {
  VerEmpleadoPage(Empleado empleado) {
    datosEmpleado = empleado;
  }
  @override
  _VerEmpleadoPageState createState() => _VerEmpleadoPageState();
}

class _VerEmpleadoPageState extends State<VerEmpleadoPage> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles Empleado'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            if (loading)
              Center(
                child: CircularProgressIndicator(),
              ),
            Text(
                "Nombre: " +
                    datosEmpleado.nombre +
                    " " +
                    datosEmpleado.apellido,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                )),
            SizedBox(
              height: 20,
            ),
            Text(
                "Identificación: " +
                    datosEmpleado.tipoIdentificacion +
                    ". " +
                    datosEmpleado.numeroIdentificacion.toString(),
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                )),
            if (datosEmpleado.correo != null)
              SizedBox(
                height: 20,
              ),
            if (datosEmpleado.correo != null)
              Text("Correo: " + datosEmpleado.correo,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                  )),
            if (datosEmpleado.fechaIngreso != null)
              SizedBox(
                height: 20,
              ),
            if (datosEmpleado.fechaIngreso != null)
              Text(
                  "Fecha ingreso: " +
                      DateTime.parse(datosEmpleado.fechaIngreso)
                          .toIso8601String()
                          .substring(0, 10),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                  )),
            SizedBox(
              height: 20,
            ),
            Text("Salario: " + datosEmpleado.salario,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                )),
          ],
        ),
      ),
    );
  }
}
