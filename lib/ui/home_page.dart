import 'package:flutter/material.dart';
import 'package:gestion_empleados/ui/formulario_inicio.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Gestión Empleados'),
        ),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/logo.png',
                  height: 100,
                ),
                SizedBox(
                  height: 50,
                ),
                Text('Iniciar Sesión',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
                FormInicio(),
              ],
            ),
          ],
        ));
  }
}
