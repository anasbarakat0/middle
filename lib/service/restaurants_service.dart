import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../theme/home_templets.dart';

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

class RestService extends StatefulWidget {
  @override
  _RestServiceState createState() => _RestServiceState();
}

class _RestServiceState extends State<RestService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchRestaurants(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            // Cast snapshot.data to Map<String, dynamic>
            Map<String, dynamic> data = snapshot.data as Map<String, dynamic>;

            List<dynamic>? restaurantList = data['data'];
            print(data['data']);
            if (restaurantList == null || restaurantList.isEmpty) {
              return Center(
                child: Text('No restaurants found.'),
              );
            }

            return SingleChildScrollView(
              child: ListView.builder(
                itemCount: restaurantList.length,
                itemBuilder: (context, index) {
                  dynamic restaurantData = restaurantList[index];
                  List<String> categories = List<String>.from(
                      restaurantData['categories'] ?? ['categories']);
            
                  String address = restaurantData['address'] ?? 'address';
            
                  String image = restaurantData['image'] ?? 'image';
            
                  String logo = restaurantData['logo'] ?? 'logo';
            
                  String name = restaurantData['name'] ?? 'name';
            
                  String open = restaurantData['workingHours'][0] ?? 'open';
                  String closed =
                      restaurantData['workingHours'][1] ?? 'close';
            String workingHours = '$open - $closed';
                  return RestaurantWidget(
                      image: image,
                      logo: logo,
                      name: name,
                      address: address,
                      workingHours: workingHours,
                      catigory: categories);
                },
              ),
            );
          } else {
            return Center(
              child: Text('Failed to fetch data.'),
            );
          }
        },
      ),
    );
  }
}

fetchRestaurants() async {
  Dio dio = Dio();

  Response response = await dio.get('http://192.168.1.115:3000/restaurants',
      options: Options(responseType: ResponseType.json));
  return response.data;
}
