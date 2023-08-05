import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:front/auth/app/injection/get_it_inject.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import '../theme/home_templets.dart';
import 'package:http/http.dart' as http;

class Restaurant {
  String logo;
  int randomCode;
  String name;
  String address;
  String phoneNumber;
  String mobileNumber;
  List<String> images;
  // WorkingHours workingHours;
  String description;
  List<String> categories;
  DateTime expirationDate;
  List<Menu> menu;
  int numberOfTables;
  Restaurant({
    required this.logo,
    required this.randomCode,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.mobileNumber,
    required this.images,
    // required this.workingHours,
    required this.description,
    required this.categories,
    required this.expirationDate,
    required this.menu,
    required this.numberOfTables,
  });

  Restaurant copyWith({
    String? logo,
    int? randomCode,
    String? name,
    String? address,
    String? phoneNumber,
    String? mobileNumber,
    List<String>? images,
    WorkingHours? workingHours,
    String? description,
    List<String>? categories,
    DateTime? expirationDate,
    List<Menu>? menu,
    int? numberOfTables,
  }) {
    return Restaurant(
      logo: logo ?? this.logo,
      randomCode: randomCode ?? this.randomCode,
      name: name ?? this.name,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      images: images ?? this.images,
      // workingHours: workingHours ?? this.workingHours,
      description: description ?? this.description,
      categories: categories ?? this.categories,
      expirationDate: expirationDate ?? this.expirationDate,
      menu: menu ?? this.menu,
      numberOfTables: numberOfTables ?? this.numberOfTables,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'logo': logo,
      'randomCode': randomCode,
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'mobileNumber': mobileNumber,
      'images': images,
      // 'workingHours': workingHours,
      'description': description,
      'categories': categories,
      'expirationDate': expirationDate.millisecondsSinceEpoch,
      'menu': menu.map((x) => x.toMap()).toList(),
      'numberOfTables': numberOfTables,
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      logo: map['logo'] as String,
      randomCode: map['randomCode'] as int,
      name: map['name'] as String,
      address: map['address'] as String,
      phoneNumber: map['phoneNumber'] as String,
      mobileNumber: map['mobileNumber'] as String,
      images: List<String>.from((map['images'] as List<String>)),
      // workingHours: map['workingHours'] as WorkingHours,
      description: map['description'] as String,
      categories: List<String>.from((map['categories'] as List<String>)),
      expirationDate:
          DateTime.fromMillisecondsSinceEpoch(map['expirationDate'] as int),
      menu: List<Menu>.from(
        (map['menu'] as List<int>).map<Menu>(
          (x) => Menu.fromMap(x as Map<String, dynamic>),
        ),
      ),
      numberOfTables: map['numberOfTables'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Restaurant.fromJson(String source) =>
      Restaurant.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Restaurant(logo: $logo, randomCode: $randomCode, name: $name, address: $address, phoneNumber: $phoneNumber, mobileNumber: $mobileNumber, images: $images, description: $description, categories: $categories, expirationDate: $expirationDate, menu: $menu, numberOfTables: $numberOfTables)';
  }

  @override
  bool operator ==(covariant Restaurant other) {
    if (identical(this, other)) return true;

    return other.logo == logo &&
        other.randomCode == randomCode &&
        other.name == name &&
        other.address == address &&
        other.phoneNumber == phoneNumber &&
        other.mobileNumber == mobileNumber &&
        listEquals(other.images, images) &&
        // other.workingHours == workingHours &&
        other.description == description &&
        listEquals(other.categories, categories) &&
        other.expirationDate == expirationDate &&
        listEquals(other.menu, menu) &&
        other.numberOfTables == numberOfTables;
  }

  @override
  int get hashCode {
    return logo.hashCode ^
        randomCode.hashCode ^
        name.hashCode ^
        address.hashCode ^
        phoneNumber.hashCode ^
        mobileNumber.hashCode ^
        images.hashCode ^
        // workingHours.hashCode ^
        description.hashCode ^
        categories.hashCode ^
        expirationDate.hashCode ^
        menu.hashCode ^
        numberOfTables.hashCode;
  }
}

class WorkingHours {
  String open;
  String close;
  WorkingHours({
    required this.open,
    required this.close,
  });

  WorkingHours copyWith({
    String? open,
    String? close,
  }) {
    return WorkingHours(
      open: open ?? this.open,
      close: close ?? this.close,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'open': open,
      'close': close,
    };
  }

  factory WorkingHours.fromMap(Map<String, dynamic> map) {
    return WorkingHours(
      open: map['open'] as String,
      close: map['close'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkingHours.fromJson(String source) =>
      WorkingHours.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'workingHours(open: $open, close: $close)';

  @override
  bool operator ==(covariant WorkingHours other) {
    if (identical(this, other)) return true;

    return other.open == open && other.close == close;
  }

  @override
  int get hashCode => open.hashCode ^ close.hashCode;
}

class Menu {
  String id;
  String menuName;
  List<Food> food;
  Menu({
    required this.id,
    required this.menuName,
    required this.food,
  });

  Menu copyWith({
    String? id,
    String? menuName,
    List<Food>? food,
  }) {
    return Menu(
      id: id ?? this.id,
      menuName: menuName ?? this.menuName,
      food: food ?? this.food,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'menuName': menuName,
      'food': food.map((x) => x.toMap()).toList(),
    };
  }

  factory Menu.fromMap(Map<String, dynamic> map) {
    return Menu(
      id: map['id'] as String,
      menuName: map['menuName'] as String,
      food: List<Food>.from(
        (map['food'] as List<int>).map<Food>(
          (x) => Food.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Menu.fromJson(String source) =>
      Menu.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Menu(id: $id, menuName: $menuName, food: $food)';

  @override
  bool operator ==(covariant Menu other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.menuName == menuName &&
        listEquals(other.food, food);
  }

  @override
  int get hashCode => id.hashCode ^ menuName.hashCode ^ food.hashCode;
}

class Food {
  String foodImage;
  String foodName;
  String foodDescription;
  String foodCategory;
  double foodPrice;
  Food({
    required this.foodImage,
    required this.foodName,
    required this.foodDescription,
    required this.foodCategory,
    required this.foodPrice,
  });

  Food copyWith({
    String? foodImage,
    String? foodName,
    String? foodDescription,
    String? foodCategory,
    double? foodPrice,
  }) {
    return Food(
      foodImage: foodImage ?? this.foodImage,
      foodName: foodName ?? this.foodName,
      foodDescription: foodDescription ?? this.foodDescription,
      foodCategory: foodCategory ?? this.foodCategory,
      foodPrice: foodPrice ?? this.foodPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'foodImage': foodImage,
      'foodName': foodName,
      'foodDescription': foodDescription,
      'foodCategory': foodCategory,
      'foodPrice': foodPrice,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      foodImage: map['foodImage'] as String,
      foodName: map['foodName'] as String,
      foodDescription: map['foodDescription'] as String,
      foodCategory: map['foodCategory'] as String,
      foodPrice: map['foodPrice'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) =>
      Food.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Food(foodImage: $foodImage, foodName: $foodName, foodDescription: $foodDescription, foodCategory: $foodCategory, foodPrice: $foodPrice)';
  }

  @override
  bool operator ==(covariant Food other) {
    if (identical(this, other)) return true;

    return other.foodImage == foodImage &&
        other.foodName == foodName &&
        other.foodDescription == foodDescription &&
        other.foodCategory == foodCategory &&
        other.foodPrice == foodPrice;
  }

  @override
  int get hashCode {
    return foodImage.hashCode ^
        foodName.hashCode ^
        foodDescription.hashCode ^
        foodCategory.hashCode ^
        foodPrice.hashCode;
  }
}

class RestService extends StatelessWidget {
  const RestService({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchRestaurants(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> data = snapshot.data as Map<String, dynamic>;

          List<dynamic>? restaurantList = data['data'];

          getIt
              .get<SharedPreferences>()
              .setString("data", restaurantList.toString());

          if (restaurantList == null || restaurantList.isEmpty) {
            return const Center(
              child: Text('No Restaurants Found.'),
            );
          }

          return Column(children: [
            RestaurantWidget(
              id: restaurantList[0]['_id'],
              image: '$url/uploads/${restaurantList[0]['Images'][0]}',
              logo: '$url/uploads/${restaurantList[0]['logo']}',
              name: restaurantList[0]['name'],
              address: restaurantList[0]['address'],
              catigory: restaurantList[0]['categories'],
              tables: restaurantList[0]['numberoftables'],
            )
          ]);
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Failed to fetch data: ${snapshot.error}'),
          );
        } else {
          return const Center(
            child: Text('Unknown error occurred.'),
          );
        }
      },
    );
  }
}

// fetchRestaurants() async {
//   Dio dio = Dio();
//   Response response = await dio.get('http://http://192.168.1.115:3000:3000/restaurants',
//       options: Options(headers: {
//         "Authorization": "Bearer ${getIt.get<SharedPreferences>().getString(
//               "token",
//             )}",
//         'Content-Type': 'application/json',
//         'Accept': '*/*',
//         'Accept-Encoding': 'gzip, deflate, br',
//         'Connection': 'keep-alive',
//       }));
//   print('your token is :....${getIt.get<SharedPreferences>().getString(
//         "token",
//       )}');
//   return response.data;
// }

Future<dynamic> fetchRestaurants() async {
  String token = getIt.get<SharedPreferences>().getString("token") ?? "";

  try {
    final response = await http.get(
    Uri.parse('$url/restaurants'),
    headers: {
      "Authorization": "Bearer $token",
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    },
  );
  print('your token is :  ++++++++++++++++++++++ ${getIt.get<SharedPreferences>().getString("token") ?? ""}');
  print(response.body);
var responsebody = json.decode(response.body);
print (responsebody);
  if (response.statusCode == 200) {
    return responsebody;
  // } else if (response.statusCode == 500) {
  //   return responsebody['message'];
  } else {
    throw Exception('Failed to load restaurants');
  }
  }catch(e){
    return 'Error: $e';
  }
}

// void fetchData() async {
//   Response response = await getRestaurants();
//   if (response != null) {
//     // Handle the response data here
//     print(response.data);
//   } else {
//     // Handle error or network issues
//     print("Failed to fetch data");
//   }
// }

// getImage(String image) async {
//   Dio dio = Dio();
//   Response response = await dio.post('http://http://192.168.1.115:3000:3000/upload',
//       options: Options(responseType: ResponseType.json));
//   print('your image should be uploaded :.. ${response.data}');
//   return response.data;
// }

Future<dynamic> getImage(String image) async {
  final response = await http.post(
    Uri.parse('$url/uploads'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(image.toString()),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    return 'https://knowledge.wharton.upenn.edu/wp-content/uploads/2016/04/network-connections.jpg';
  }
}
