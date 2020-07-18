import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EmpleadosPage extends StatefulWidget {
  @override
  _EmpleadosPageState createState() => _EmpleadosPageState();
}

class _EmpleadosPageState extends State<EmpleadosPage> {
  void handleNuevoEmpleadoTap(BuildContext context) {
    print('nuevo empleado');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(automaticallyImplyLeading: false),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[],
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
