import 'dart:convert';
import 'package:http/http.dart' as http;
import '../main.dart';

final uri = Uri.parse(url);
final headers = {
  'Content-Type': 'application/json',
};

Future<dynamic> changeProfileData(
    String name, String phone, String address) async {
  final uri = Uri.parse('$url/users/$userId');

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
    return 'An error occurred while making the request';
  }
}

void getData() async {
  final uri = Uri.parse('$url/api/users/$userId');
  final response = await http.get(uri);

  final responseBody = json.decode(response.body);
  try {
    if (response.statusCode == 200) {
      userName = responseBody['name'];
      phone = responseBody['phone'];
      address = responseBody['address'];
      return;
    } else {
      return;
    }
  } catch (e) {
    // ignore: avoid_print
    print('Error: $e');

  }
}
