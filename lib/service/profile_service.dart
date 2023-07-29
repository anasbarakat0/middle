import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

const url = 'http://localhost:3000';
final uri = Uri.parse(url);
final headers = {
  'Content-Type': 'application/json',
};

Future<dynamic> changeProfileData(
    String name, String phone, String address) async {
  final uri = Uri.parse('$url/users/$Id');

  final body = jsonEncode({"name": name, "phone": phone, "address": address});

  final response = await http.put(uri, headers: headers, body: body);

  try {
    if (response.statusCode == 200) {
      getData();
      return [(true), 'Edit Done'];
    } else {
      return [(true), (response.body)];
    }
  } catch (e) {
    // An error occurred while making the request.
    print('Error: $e');
  }
}

void getData() async {
  print(Id);
  final uri = Uri.parse('$url/api/users/$Id');
  print(uri);
  final response = await http.get(uri);

  final responseBody = json.decode(response.body);
  try {
    if (response.statusCode == 200) {
      print('Done Baby');
      userName = responseBody['name'];
      phone = responseBody['phone'];
      address = responseBody['address'];
      return;
    } else {
      print('False : ${response.body}');
      return;
    }
  } catch (e) {
    print('Error: $e');
  }
}
