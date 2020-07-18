import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gestion_empleados/data/repository/storage_impl.dart';
import 'package:gestion_empleados/ui/empleados/empleados_page.dart';
import 'package:http/http.dart' as http;

class FormInicio extends StatefulWidget {
  @override
  _FormInicioState createState() => _FormInicioState();
}

class _FormInicioState extends State<FormInicio> {
  final _formKey = GlobalKey<FormState>();
  final passController = TextEditingController();
  final mailController = TextEditingController();
  final storage = StorageImpl();
  bool loading = false;

  void handleIniciarSesion(BuildContext context) async {
    Map bodyData = {
      'correo': '${mailController.text}',
      'contraseña': '${passController.text}'
    };
    var body = json.encode(bodyData);

    setState(() {
      loading = true;
    });

    final response = await http.post(
        'https://gestion-empleados.herokuapp.com/usuarios/login',
        headers: {"Content-Type": "application/json"},
        body: body);
    final dataJson = jsonDecode(response.body);
    setState(() {
      loading = false;
    });
    if (dataJson['data'] == null) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(dataJson['msg']),
        backgroundColor: ThemeData.light().errorColor,
      ));
    } else {
      storage.saveToken(dataJson['data']['token']);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => EmpleadosPage()));
    }
  }

  void dispose() {
    passController.dispose();
    mailController.dispose();
    super.dispose();
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
                  if (loading)
                    Center(
                      child: CircularProgressIndicator(),
                    ),
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
                    controller: mailController,
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
                    controller: passController,
                    obscureText: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: RaisedButton(
                      onPressed: () {
                        // devolverá true si el formulario es válido, o falso si
                        // el formulario no es válido.
                        if (_formKey.currentState.validate()) {
                          // Si el formulario es válido, queremos mostrar un Snackbar
                          handleIniciarSesion(context);
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
