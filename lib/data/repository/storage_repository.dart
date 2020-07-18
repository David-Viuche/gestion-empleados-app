abstract class StorageRepository {
  Future<void> saveToken(String token);
  Future<String> getToken();
}
