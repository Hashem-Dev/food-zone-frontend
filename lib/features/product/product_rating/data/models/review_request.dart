import 'dart:convert';

ReviewRequest reviewRequestFromJson(String str) =>
    ReviewRequest.fromJson(json.decode(str));

String reviewRequestToJson(ReviewRequest data) => json.encode(data.toJson());

class ReviewRequest {
  final double userRating;
  final String review;
  final List<String> reviewImages;

  ReviewRequest({
    required this.userRating,
    required this.review,
    required this.reviewImages,
  });

  factory ReviewRequest.fromJson(Map<String, dynamic> json) => ReviewRequest(
        userRating: json["userRating"]?.toDouble(),
        review: json["review"],
        reviewImages: List<String>.from(json["reviewImages"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "userRating": userRating,
        "review": review,
        "reviewImages": List<dynamic>.from(reviewImages.map((x) => x)),
      };
}
