import 'package:flutter/material.dart';
import 'package:gestion_empleados/ui/empleados/empleados_page.dart';

class FormInicio extends StatefulWidget {
  @override
  _FormInicioState createState() => _FormInicioState();
}

class _FormInicioState extends State<FormInicio> {
  final _formKey = GlobalKey<FormState>();

  void handleNavigateTap(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => EmpleadosPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Ingrese su correo',
                        labelStyle: TextStyle(fontSize: 18),
                        hintStyle: TextStyle(fontSize: 18)),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor ingrese su correo';
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Ingrese su contraseña',
                        labelStyle: TextStyle(fontSize: 18),
                        hintStyle: TextStyle(fontSize: 18)),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor ingrese su correo';
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: RaisedButton(
                      onPressed: () {
                        // devolverá true si el formulario es válido, o falso si
                        // el formulario no es válido.
                        if (_formKey.currentState.validate()) {
                          // Si el formulario es válido, queremos mostrar un Snackbar
                          handleNavigateTap(context);
                        }
                      },
                      child: Text('Enviar'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
