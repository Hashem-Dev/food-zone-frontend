class OrderUserReview {
  final String id;
  double? rating;
  String? review;
  String? image;

  OrderUserReview({
    required this.id,
    this.rating,
    this.image,
    this.review,
  });

  @override
  // TODO: implement hashCode
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrderUserReview && other.id == id;
  }
}
