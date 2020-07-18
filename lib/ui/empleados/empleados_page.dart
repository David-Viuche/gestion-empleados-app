import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gestion_empleados/data/repository/storage_impl.dart';
import 'package:gestion_empleados/models/empleado.dart';
import 'package:http/http.dart' as http;

class EmpleadosPage extends StatefulWidget {
  @override
  _EmpleadosPageState createState() => _EmpleadosPageState();
}

class _EmpleadosPageState extends State<EmpleadosPage> {
  final storage = StorageImpl();
  bool loading = false;
  int contadorPeticion = 0;
  List<Empleado> empleados = [];

  void handleNuevoEmpleadoTap(BuildContext context) async {
    print('nuevo empleado');
  }

  @override
  Widget build(BuildContext context) {
    void peticionEmpleados() async {
      setState(() {
        loading = true;
      });

      String token = await storage.getToken();

      final response = await http
          .get('https://gestion-empleados.herokuapp.com/empleados', headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      });
      final dataJson = jsonDecode(response.body) as List;

      setState(() {
        empleados = dataJson.map((e) => Empleado.fromJson(e)).toList();
        empleados.sort((a, b) {
          if (a.id > b.id) {
            return 1;
          }
          if (a.id < b.id) {
            return -1;
          }
          return 0;
        });
        loading = false;
        contadorPeticion = 1;
      });
    }

    if (contadorPeticion == 0) {
      peticionEmpleados();
    }

    return Scaffold(
      appBar: new AppBar(
          title: Text('Empleados'), automaticallyImplyLeading: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (loading)
            SizedBox(
              height: 50,
            ),
          if (loading)
            Center(
              child: CircularProgressIndicator(),
            ),
          // SizedBox(
          //   height: 50,
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 39, vertical: 20),
              child: ListView.builder(
                  itemCount: empleados.length,
                  itemBuilder: (context, index) {
                    final empleado = empleados[index];
                    return ListTile(
                      title: Text(empleado.nombre + " " + empleado.apellido),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.add_box,
                          color: ThemeData.light().iconTheme.color,
                        ),
                        onPressed: () {},
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        onPressed: () => handleNuevoEmpleadoTap(context),
        tooltip: 'Empleado Nuevo',
        elevation: 0,
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
