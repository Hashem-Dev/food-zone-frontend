import 'dart:convert';

List<OrdersResponse> ordersResponseFromJson(String str) =>
    List<OrdersResponse>.from(
        json.decode(str).map((x) => OrdersResponse.fromJson(x)));

class OrdersResponse {
  final String id;
  final double totalPrice;
  final String status;
  final String orderNumber;
  final List<OrderImages> orderImages;

  OrdersResponse({
    required this.id,
    required this.totalPrice,
    required this.status,
    required this.orderNumber,
    required this.orderImages,
  });

  factory OrdersResponse.fromJson(Map<String, dynamic> json) => OrdersResponse(
        id: json['id'],
        totalPrice: json["totalPrice"]?.toDouble(),
        status: json["status"],
        orderNumber: json["orderNumber"],
        orderImages: List<OrderImages>.from(
            json["allImages"].map((x) => OrderImages.fromJson(x))),
      );
}

class OrderImages {
  final String url;
  final String publicId;

  OrderImages({
    required this.url,
    required this.publicId,
  });

  factory OrderImages.fromJson(Map<String, dynamic> json) => OrderImages(
        url: json["url"],
        publicId: json["publicId"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "publicId": publicId,
      };
}
