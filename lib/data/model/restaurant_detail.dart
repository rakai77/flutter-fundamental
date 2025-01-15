import 'package:restaurant_app/data/model/customer_reviews.dart';
import 'package:restaurant_app/data/model/item.dart';
import 'package:restaurant_app/data/model/menu.dart';

class RestaurantDetail {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final String address;
  final List<Item> categories;
  final MenuItem menus;
  final List<CustomerReview> customerReviews;
  final num rating;

  RestaurantDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.address,
    required this.categories,
    required this.menus,
    required this.customerReviews,
    required this.rating,
  });

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) {
    return RestaurantDetail(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      pictureId: json["pictureId"],
      city: json["city"],
      address: json["address"],
      categories: json["categories"] != null
        ? List<Item>.from(json["categories"]!.map((item) => Item.fromJson(item)))
        : <Item>[],
      menus: MenuItem.fromJson(json["menus"]),
      customerReviews: json["customerReviews"] != null
        ? List<CustomerReview>.from(json["customerReviews"]!.map((item) => CustomerReview.fromJson(item)))
        : <CustomerReview>[],
      rating: json["rating"]
    );
  }
}