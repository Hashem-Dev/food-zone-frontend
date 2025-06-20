import 'dart:convert';

ProductRatingDetails productRatingDetailsFromJson(String str) =>
    ProductRatingDetails.fromJson(json.decode(str));

String productRatingDetailsToJson(ProductRatingDetails data) =>
    json.encode(data.toJson());

class ProductRatingDetails {
  final int totalReviews;
  final List<Rating> ratings;

  ProductRatingDetails({
    required this.totalReviews,
    required this.ratings,
  });

  factory ProductRatingDetails.fromJson(Map<String, dynamic> json) =>
      ProductRatingDetails(
        totalReviews: json["totalReviews"],
        ratings:
            List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalReviews": totalReviews,
        "ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
      };
}

class Rating {
  final int rating;
  final int count;
  final String percentage;

  Rating({
    required this.rating,
    required this.count,
    required this.percentage,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rating: json["rating"],
        count: json["count"],
        percentage: json["percentage"],
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "count": count,
        "percentage": percentage,
      };
}
