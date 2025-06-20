import 'dart:convert';

/// Converts a JSON string into a list of [OffersResponse] objects.
///
/// @param str The JSON string to be converted.
/// @returns A list of [OffersResponse] objects.
List<OffersResponse> offersResponseFromJson(String str) =>
    List<OffersResponse>.from(
        json.decode(str).map((x) => OffersResponse.fromJson(x)));

/// Converts a list of [OffersResponse] objects into a JSON string.
///
/// @param data The list of [OffersResponse] objects to be converted.
/// @returns A JSON string representation of the list.
String offersResponseToJson(List<OffersResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// Represents an offer response with details such as id, images, price, rating, etc.
class OffersResponse {
  /// The unique identifier of the offer.
  final String id;

  /// A list of images associated with the offer.
  final List<OfferImage> images;

  /// Indicates whether the item is on offer.
  final bool isOffer;

  /// The price of the item.
  final double price;

  /// The price of the item without any discount.
  final double priceWithoutDiscount;

  /// The rating of the item.
  final double rating;

  /// The count of ratings the item has received.
  final String ratingCount;

  /// The title of the offer in different languages.
  final Title title;

  /// Creates an instance of [OffersResponse].
  ///
  /// @param id The unique identifier of the offer.
  /// @param images A list of images associated with the offer.
  /// @param isOffer Indicates whether the item is on offer.
  /// @param price The price of the item.
  /// @param priceWithoutDiscount The price of the item without any discount.
  /// @param rating The rating of the item.
  /// @param ratingCount The count of ratings the item has received.
  /// @param title The title of the offer in different languages.
  OffersResponse({
    required this.id,
    required this.images,
    required this.isOffer,
    required this.price,
    required this.priceWithoutDiscount,
    required this.rating,
    required this.ratingCount,
    required this.title,
  });

  /// Creates an instance of [OffersResponse] from a JSON object.
  ///
  /// @param json The JSON object to be converted.
  /// @returns An instance of [OffersResponse].
  factory OffersResponse.fromJson(Map<String, dynamic> json) => OffersResponse(
        id: json["_id"],
        images: List<OfferImage>.from(
            json["images"].map((x) => OfferImage.fromJson(x))),
        isOffer: json["isOffer"],
        price: json["price"]?.toDouble(),
        priceWithoutDiscount: json["priceWithoutDiscount"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        ratingCount: json["ratingCount"],
        title: Title.fromJson(json["title"]),
      );

  /// Converts an instance of [OffersResponse] into a JSON object.
  ///
  /// @returns A JSON object representation of the instance.
  Map<String, dynamic> toJson() => {
        "_id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "isOffer": isOffer,
        "price": price,
        "priceWithoutDiscount": priceWithoutDiscount,
        "rating": rating,
        "ratingCount": ratingCount,
        "title": title.toJson(),
      };
}

/// Represents an image associated with an offer.
class OfferImage {
  /// The public identifier of the image.
  final String publicId;

  /// The URL of the image.
  final String url;

  /// Creates an instance of [OfferImage].
  ///
  /// @param publicId The public identifier of the image.
  /// @param url The URL of the image.
  OfferImage({
    required this.publicId,
    required this.url,
  });

  /// Creates an instance of [OfferImage] from a JSON object.
  ///
  /// @param json The JSON object to be converted.
  /// @returns An instance of [OfferImage].
  factory OfferImage.fromJson(Map<String, dynamic> json) => OfferImage(
        publicId: json["publicId"],
        url: json["url"],
      );

  /// Converts an instance of [OfferImage] into a JSON object.
  ///
  /// @returns A JSON object representation of the instance.
  Map<String, dynamic> toJson() => {
        "publicId": publicId,
        "url": url,
      };
}

/// Represents the title of an offer in different languages.
class Title {
  /// The title in Arabic.
  final String ar;

  /// The title in English.
  final String en;

  /// Creates an instance of [Title].
  ///
  /// @param ar The title in Arabic.
  /// @param en The title in English.
  Title({
    required this.ar,
    required this.en,
  });

  /// Creates an instance of [Title] from a JSON object.
  ///
  /// @param json The JSON object to be converted.
  /// @returns An instance of [Title].
  factory Title.fromJson(Map<String, dynamic> json) => Title(
        ar: json["ar"],
        en: json["en"],
      );

  /// Converts an instance of [Title] into a JSON object.
  ///
  /// @returns A JSON object representation of the instance.
  Map<String, dynamic> toJson() => {
        "ar": ar,
        "en": en,
      };
}
