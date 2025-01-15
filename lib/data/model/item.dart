class Item {
  final String name;

  Item({required this.name});

  factory Item.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "name": String name
      } => Item(name: name), _=> throw const FormatException('Failed to load item data.')
    };
  }
}