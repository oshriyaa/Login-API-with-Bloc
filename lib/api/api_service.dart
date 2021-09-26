import 'package:http/http.dart' as http;
import 'package:login_bloc/model/profile_data.dart';
import 'dart:convert';

import '../main.dart';

class APIService {
  static Future login(String email, String password) async {
    var url = Uri.parse("https://api.ikreate.com.np/intern/login");
    var reqHeader = {
      'primary-auth': 'api.ikreate.com.np',
    };
    var requestBody = {
      "email-address": "$email",
      "password": "$password",
    };
    try {
      http.Response response = await http.post(
        url,
        headers: requestBody,
        body: requestBody,
      );
      if (response.statusCode == 200) {
        var decodedResponse = json.decode(response.body);
        print(decodedResponse);

        print('Response status: ${response.statusCode}');
        print('access-token = ${decodedResponse['access_token']}');
        print('refresh-token = ${decodedResponse['refresh_token']}');
        return decodedResponse;
      }
    } catch (e) {}
  }

  static Future logout() async {
    final String? accessToken = await secureStorage?.read(key: 'access-token');
    final String? refreshToken =
        await secureStorage?.read(key: 'refresh-token');
    print(' Logout TOKEN');
    print(accessToken);
    print(refreshToken);

    final String logoutURL = "https://api.ikreate.com.np/intern/logout";
    var decodedResponse;

    try {
      final response = await http.post(
        Uri.parse(logoutURL),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'primary-auth': 'api.ikreate.com.np',
          'access-token': '$accessToken',
          'refresh-token': '$refreshToken'
        },
      );
      if (response.statusCode == 200) {
        decodedResponse = json.decode(response.body);
        print('Response Status: ${response.statusCode}');
        print('DECODE RESPONSE ${decodedResponse}');

        return decodedResponse;
      }
    } catch (e) {}
  }

  static Future<UserProfile?> getUserProfile() async {
    final String? accessToken = await secureStorage?.read(key: 'access-token');
    final String? refreshToken =
        await secureStorage?.read(key: 'refresh-token');
    print('Profile Token');
    print(accessToken);
    print(refreshToken);

    final String profileURL = "https://api.ikreate.com.np/intern/profile";
    var decodedResponse;

    try {
      final response = await http.get(
        Uri.parse(profileURL),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'primary-auth': 'api.ikreate.com.np',
          'access-token': '$accessToken',
          'refresh-token': '$refreshToken'
        },
      );
      if (response.statusCode == 200) {
        decodedResponse = UserProfile.fromJson(json.decode(response.body));

        print('Response Status: ${response.statusCode}');
        print("response: ${decodedResponse.runtimeType}");
        return decodedResponse;
      }
      return null;
    } catch (e) {}
  }
}



// class APIService {
//   static Future login(String email, String password) async {
//     final String loginURL = "https://api.ikreate.com.np/intern/login";
//     var requestBody = {'email-address': '$email', 'password': '$password'};
//     var decodedResponse;

//     final response = await http.post(Uri.parse(loginURL),
//         headers: <String, String>{
//           'Content-Type': 'application/x-www-form-urlencoded',
//           'primary-auth': 'api.ikreate.com.np'
//         },
//         body: requestBody);
//     if (response.statusCode == 200) {
//       decodedResponse = json.decode(response.body);

//       if (decodedResponse["status"] == "success") {
//         print('STATUS SUCCESS $decodedResponse');

//         var access = decodedResponse['access_token'];
//         var refresh = decodedResponse["refresh_token"];

//         print('ACCESS TOKEN1 = $access');
//         print('REFRESH TOKEN1 = $refresh');

//         // secureStorage?.writeSecureData(access, refresh);
//         print('DECODED RESPONSE ${decodedResponse}');

//         return decodedResponse;
//       }
//     }
//     return null;
//     // throw HTTPException(response.statusCode, "Error fetching data");
//   }

//   static Future logout() async {
//     final String? accessToken = await secureStorage?.read(key: 'access-token');
//     final String? refreshToken =
//         await secureStorage?.read(key: 'refresh-token');
//     print('FIRST TOKEN');
//     print(accessToken);
//     print(refreshToken);

//     final String logoutURL = "https://api.ikreate.com.np/intern/logout";
//     var decodedResponse;

//     final response =
//         await http.post(Uri.parse(logoutURL), headers: <String, String>{
//       'Content-Type': 'application/x-www-form-urlencoded',
//       'primary-auth': 'api.ikreate.com.np',
//       'access-token': '$accessToken',
//       'refresh-token': '$refreshToken'
//     });
//     if (response.statusCode == 200) {
//       decodedResponse = json.decode(response.body);
//       // secureStorage?.deleteSecureData();

//       return decodedResponse;
//     }
//     return null;
//     // throw HTTPException(response.statusCode, "Error fetching data");
//   }

//   static Future<UserProfile?> getUserProfile() async {
//     final String? accessToken = await secureStorage?.read(key: 'access-token');
//     final String? refreshToken =
//         await secureStorage?.read(key: 'refresh-token');
//     final String profileURL = "https://api.ikreate.com.np/intern/profile";
//     var decodedResponse;

//     final response =
//         await http.get(Uri.parse(profileURL), headers: <String, String>{
//       'Content-Type': 'application/x-www-form-urlencoded',
//       'primary-auth': 'api.ikreate.com.np',
//       'access-token': '$accessToken',
//       'refresh-token': '$refreshToken'
//     });
//     if (response.statusCode == 200) {
//       decodedResponse = UserProfile.fromJson(json.decode(response.body));
//       print("PROFILE RESPONSE API: $decodedResponse");

//       return decodedResponse;
//     }
//     return null;
//     // throw HTTPException(response.statusCode, "Error fetching data");
//   }
// }
