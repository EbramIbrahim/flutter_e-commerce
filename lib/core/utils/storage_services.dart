import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageServices {
  final storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  Future saveToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<String?> readToken() async {
    return await storage.read(key: 'token') ?? "";
  }

  Future deleteToken() async {
    await storage.delete(key: 'token');
  }
}
