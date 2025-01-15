extension ImageUrlExtension on String {
  String get smallImageUrl => 'https://restaurant-api.dicoding.dev/images/small/$this';
  String get mediumImageUrl => 'https://restaurant-api.dicoding.dev/images/medium/$this';
  String get largeImageUrl => 'https://restaurant-api.dicoding.dev/images/large/$this';
}