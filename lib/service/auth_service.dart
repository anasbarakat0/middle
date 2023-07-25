import 'dart:convert';
import 'package:front/service/profile_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

const url = 'http://localhost:3000';
final uri = Uri.parse(url);
final headers = {
  'Content-Type': 'application/json',
};

class UserLogin {
  late final String phone;
  late final String password;

  UserLogin(this.phone, this.password);
  Map<String, dynamic>? toJson() {
    return {
      'phone': phone,
      'password': password,
    };
  }
}

login(String phone, String password) async {
  final uri = Uri.parse('$url/login');

  final user = UserLogin(phone, password);
  final jsonString = jsonEncode(user.toJson());

  try {
    final response = await http.post(uri, headers: headers, body: jsonString);

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      token = '{token: ${responseJson['token']}}';
      Id = responseJson['id'];
      print('Token: $token');
      print('Id: $Id');
      getData();
      return true;
    } else {
      final responseBody = json.decode(response.body);
      final message = responseBody['message'];
      print('Error: $message');
      return message;
    }
  } catch (e) {
    print('Error: $e');
    return 'An error occurred during login.';
  }
}

// signup (String name,String password, String phone,String address) async{
//   final response = await http.post(uri,body: {"name":name,"password":password,"phone":phone,"address":address});
// }
class User {
  late final String name;
  late final String password;
  late final String phone;
  late final String address;

  User(this.name, this.password, this.phone, this.address);
  Map<String, dynamic>? toJson() {
    return {
      'name': name,
      'password': password,
      'phone': phone,
      'address': address,
    };
  }
}

signup(String name, String password, String phone, String address) async {
  final uri = Uri.parse('$url/signup');

  final user = User(name, password, phone, address);
  final jsonString = jsonEncode(user.toJson());

  try {
    final response = await http.post(uri, headers: headers, body: jsonString);

    final responseBody = json.decode(response.body);
    final message = responseBody['message'];

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('name', name);
      prefs.setString('password', password);
      prefs.setString('phone', phone);
      prefs.setString('address', address);
      return [true, message];
    } else {
      return message;
    }
  } catch (e) {
    print('Error: $e');
    return 'An error occurred during signup.';
  }
}

Future<void> fetchRestaurants() async {
  final header = {
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/json'
  };

  try {
    final response =
        await http.get(Uri.parse('$url/restaurants'), headers: header);

    if (response.statusCode == 200) {
      print("Request was successful, parse the response JSON");
      final restaurants = json.decode(response.body)['restaurants'];
      print(restaurants);
    } else if (response.statusCode == 401) {
      print('Unauthorized');
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

forgetPassword(String name, String phone) async {
  final uri = Uri.parse('$url/forgot-password');
  final body = jsonEncode({'name': name, 'phone': phone});
  final response = await http.post(uri, headers: headers, body: body);
  final responseBody = json.decode(response.body);
  final message = responseBody['message'];
  if (response.statusCode == 200) {
    print('200');
    print(message);
    return [true, message];
  } else {
    print('error');
    print(message);
    return message;
  }
}

changePassword(String phone, int code, String password) async {
  final uri = Uri.parse('$url/change-password');
  final body =
      jsonEncode({'phone': phone, 'randomCode': code, 'newPassword': password});
  final response = await http.post(uri, headers: headers, body: body);
  final responseBody = json.decode(response.body);
  final message = responseBody['message'];
  if (response.statusCode == 200) {
    return [true, message];
  } else if (response.statusCode == 404) {
    return [false, message];
  } else {
    return [false, message];
  }
}
