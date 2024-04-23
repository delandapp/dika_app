import 'package:get_storage/get_storage.dart';


class StorageProvider {
  static write(key, String value) async {
    await GetStorage().write(key, value);
  }


  static String read(key) {
    try {
      return GetStorage().read(key);
    } catch (e) {
      return "";
    }
  }


  static void clearAll() {
    GetStorage().erase();
  }
}


class StorageKey {
  static const String status = "status";
  static const String username = "username";
  static const String idUser = '1';
   static const String bearerToken = '';
  static const String email = "email";
  static const String bio = "Bio";
  static const String telepon = "telepon";
  static const String namaLengkap = "namaLengkap";
}