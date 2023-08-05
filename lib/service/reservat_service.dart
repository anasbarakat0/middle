import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/app/injection/get_it_inject.dart';
import '../main.dart';

final uri = Uri.parse(url);
final headers = {
  'Content-Type': 'application/json',
  "Authorization":
      "Bearer ${getIt.get<SharedPreferences>().getString('token') ?? ''}",
};
getTable(int number) async {
  final uri = Uri.parse(
      '$url/restaurant/${getIt.get<SharedPreferences>().getString('RestaurantID') ?? ''}/tables/$number');
  try {
    final response = await http.get(uri, headers: headers);
    final responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      return responseBody['id'];
    }
  } catch (e) {
    return 'An error occurred during reservate.';
  }
}

addReservation(int number, String date, int people) async {
  dynamic id = await getTable(number);

  final uri = Uri.parse(
      '$url/api/restaurants/${getIt.get<SharedPreferences>().getString('RestaurantID') ?? ''}/tables/$id/reservations');
  Future.delayed(
    const Duration(seconds: 2),
    () async {
      try {
        final response = await http.post(
          uri,
          headers: headers,
          body: jsonEncode(
            {
              "userId": userId,
              "customerName": userName,
              "customerNumber": phone,
              "reservationDate": date,
              "numberOfPeople": people,
              "reservationType": "lunch"
            },
          ),
        );
        print ('your token is :>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${getIt.get<SharedPreferences>().getString('RestaurantID') ?? ''}');
        print ('your body is :>................................. ${jsonEncode(
        
            {
              "userId": userId,
              "customerName": userName,
              "customerNumber": phone,
              "reservationDate": date,
              "numberOfPeople": people,
              "reservationType": "lunch"
            },
          )}');
        final responseBody = json.decode(response.body);
        if (response.statusCode == 200) {
          return responseBody['message'];
        } else if (response.statusCode == 400) {
          return responseBody['message'];
        } else {
          return responseBody['message'];
        }
      } catch (e) {
        return 'An error occurred during reservate.';
      }
    },
  );
}

showReservations() async {
  final uri = Uri.parse('$url/reservations');
  try {
    final response = await http.get(uri, headers: headers);
    final responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      return responseBody;
    } else if (response.statusCode == 500) {
      return responseBody['message'];
    } else {
      return 'An error occurred during showing reservations';
    }
  } catch (e) {
    return 'An error occurred during showing reservations';
  }
}
