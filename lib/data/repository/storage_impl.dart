import 'package:gestion_empleados/data/repository/storage_repository.dart';

import 'package:shared_preferences/shared_preferences.dart';

class StorageImpl extends StorageRepository {
  @override
  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token').toString();
    return token;
  }

  @override
  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }
}
