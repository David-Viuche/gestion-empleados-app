import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gestion_empleados/data/repository/storage_impl.dart';
import 'package:gestion_empleados/ui/empleados/empleados_page.dart';
import 'package:http/http.dart' as http;

class CrearEmpleadoPage extends StatefulWidget {
  @override
  _CrearEmpleadoPageState createState() => _CrearEmpleadoPageState();
}

class _CrearEmpleadoPageState extends State<CrearEmpleadoPage> {
  final _formKey = GlobalKey<FormState>();
  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final tipoIdController = TextEditingController();
  final idController = TextEditingController();
  final salarioController = TextEditingController();
  final storage = StorageImpl();
  bool loading = false;
  String dropdownValue = 'One';

  void peticionCrearNuevoEmpleado(BuildContext context) async {
    setState(() {
      loading = true;
    });

    String token = await storage.getToken();

    Map bodyData = {
      "nombre": '${nombreController.text}',
      "apellido": '${apellidoController.text}',
      "tipoIdentificacion": '${tipoIdController.text}',
      "numeroIdentificacion": '${idController.text}',
      "salario": '${salarioController.text}'
    };
    var body = json.encode(bodyData);

    final response = await http.post(
        'https://gestion-empleados.herokuapp.com/empleados',
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: body);

    print(response);
    setState(() {
      loading = false;
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => EmpleadosPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Crear Empleado'),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
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
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Ingrese nombre',
                      labelStyle: TextStyle(fontSize: 18),
                      hintStyle: TextStyle(fontSize: 18)),
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor ingrese nombre';
                    }
                  },
                  controller: nombreController,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Ingrese apellido',
                      labelStyle: TextStyle(fontSize: 18),
                      hintStyle: TextStyle(fontSize: 18)),
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor ingrese su apellido';
                    }
                  },
                  controller: apellidoController,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Ingrese tipo documento (cc - nit)',
                      labelStyle: TextStyle(fontSize: 18),
                      hintStyle: TextStyle(fontSize: 18)),
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor ingrese tipo documento';
                    }
                  },
                  controller: tipoIdController,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Ingrese documento ',
                      labelStyle: TextStyle(fontSize: 18),
                      hintStyle: TextStyle(fontSize: 18)),
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor ingrese documento';
                    }
                  },
                  controller: idController,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Ingrese salario ',
                      labelStyle: TextStyle(fontSize: 18),
                      hintStyle: TextStyle(fontSize: 18)),
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor ingrese salario';
                    }
                  },
                  controller: salarioController,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        peticionCrearNuevoEmpleado(context);
                      }
                    },
                    child: Text('Enviar'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
