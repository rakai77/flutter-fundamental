import 'package:restaurant_app/data/model/item.dart';

class MenuItem {
  final List<Item> foods;
  final List<Item> drinks;

  MenuItem({
    required this.foods,
    required this.drinks
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
        foods: json["foods"] != null
            ? List<Item>.from(json["foods"]!.map((item) => Item.fromJson(item)))
            : <Item>[],
        drinks: json["drinks"] != null
            ? List<Item>.from(json["drinks"]!.map((item) => Item.fromJson(item)))
            : <Item>[]
    );
  }
}