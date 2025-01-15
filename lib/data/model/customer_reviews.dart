class CustomerReview{
  final String name;
  final String review;
  final String date;

  CustomerReview({
    required this.name,
    required this.review,
    required this.date
  });

  factory CustomerReview.fromJson(Map<String, dynamic> json) {
    return switch(json) {
      {
      "name": String name,
      "review": String review,
      "date": String date,
      } =>
          CustomerReview(
            name: name,
            review: review,
            date: date,
          ),
      _ => throw const FormatException('Failed to load customer review data.')
    };
  }
}