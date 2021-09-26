import 'package:login_bloc/main.dart';

  Future readSecureData(String key) async {
    var readData = await secureStorage?.read(key: key);

    return readData;
  }

  isLoggedIn() async {
    String? token = await secureStorage?.read(key: 'access-token');
    if (token != null)
      return true;
    else
      return false;
  }

   writeSecureData(accessToken, refreshToken) async {
    await secureStorage?.write(key: 'access-token', value: accessToken);
    await secureStorage?.write(key: 'refresh-token', value: refreshToken);
  }

   deleteSecureData() async {
    await secureStorage?.deleteAll();
  }

