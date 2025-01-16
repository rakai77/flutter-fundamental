class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final num rating;

  Restaurant(
      {required this.id,
      required this.name,
      required this.description,
      required this.pictureId,
      required this.city,
      required this.rating});

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "id": String id,
        "name": String name,
        "description": String description,
        "pictureId": String pictureId,
        "city": String city,
        "rating": num rating
      } =>
        Restaurant(
            id: id,
            name: name,
            description: description,
            pictureId: pictureId,
            city: city,
            rating: rating),
      _ => throw const FormatException('Failed to load tourism data.')
    };
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic> {
      "id": id,
      "name": name,
      "description": description,
      "pictureId": pictureId,
      "city": city,
      "rating": rating
    };
  }
}
