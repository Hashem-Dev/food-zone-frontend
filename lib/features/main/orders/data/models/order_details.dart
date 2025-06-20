import 'dart:convert';

OrderDetails orderDetailsFromJson(String str) =>
    OrderDetails.fromJson(json.decode(str));

String orderDetailsToJson(OrderDetails data) => json.encode(data.toJson());

class OrderDetails {
  final String id;
  final String cancellationReason;
  final DateTime createdAt;
  final String deliveryInstruction;
  final double discount;
  final List<Item> items;
  final String orderNumber;
  final List<Promotion> promotions;
  final int rating;
  final ShippingAddress shippingAddress;
  final double shippingCost;
  final String status;
  final double totalPrice;
  final String updatedAt;
  final String user;

  OrderDetails({
    required this.id,
    required this.cancellationReason,
    required this.createdAt,
    required this.deliveryInstruction,
    required this.discount,
    required this.items,
    required this.orderNumber,
    required this.promotions,
    required this.rating,
    required this.shippingAddress,
    required this.shippingCost,
    required this.status,
    required this.totalPrice,
    required this.updatedAt,
    required this.user,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
        id: json["_id"],
        cancellationReason: json["cancellationReason"],
        createdAt: DateTime.parse(json["createdAt"]),
        deliveryInstruction: json["deliveryInstruction"],
        discount: json["discount"]?.toDouble(),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        orderNumber: json["orderNumber"],
        promotions: List<Promotion>.from(
            json["promotions"].map((x) => Promotion.fromJson(x))),
        rating: json["rating"],
        shippingAddress: ShippingAddress.fromJson(json["shippingAddress"]),
        shippingCost: json["shippingCost"]?.toDouble(),
        status: json["status"],
        totalPrice: json["totalPrice"]?.toDouble(),
        updatedAt: json["updatedAt"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "cancellationReason": cancellationReason,
        "createdAt": createdAt,
        "deliveryInstruction": deliveryInstruction,
        "discount": discount,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "orderNumber": orderNumber,
        "promotions": List<dynamic>.from(promotions.map((x) => x.toJson())),
        "rating": rating,
        "shippingAddress": shippingAddress.toJson(),
        "shippingCost": shippingCost,
        "status": status,
        "totalPrice": totalPrice,
        "updatedAt": updatedAt,
        "user": user,
      };
}

class Item {
  final String id;
  final List<Additive> additives;
  final Meal meal;
  final double price;
  final int quantity;

  Item({
    required this.id,
    required this.additives,
    required this.meal,
    required this.price,
    required this.quantity,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["_id"],
        additives: List<Additive>.from(
            json["additives"].map((x) => Additive.fromJson(x))),
        meal: Meal.fromJson(json["meal"]),
        price: json["price"]?.toDouble(),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "additives": List<dynamic>.from(additives.map((x) => x.toJson())),
        "meal": meal.toJson(),
        "price": price,
        "quantity": quantity,
      };
}

class Additive {
  final String id;
  final Description description;
  final double price;
  final AdditiveTitle title;
  final String type;

  Additive({
    required this.id,
    required this.description,
    required this.price,
    required this.title,
    required this.type,
  });

  factory Additive.fromJson(Map<String, dynamic> json) => Additive(
        id: json["_id"],
        description: Description.fromJson(json["description"]),
        price: json["price"].toDouble(),
        title: AdditiveTitle.fromJson(json["title"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "description": description.toJson(),
        "price": price,
        "title": title.toJson(),
        "type": type,
      };
}

class Description {
  final String ar;
  final String en;

  Description({
    required this.ar,
    required this.en,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        ar: json["ar"],
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "ar": ar,
        "en": en,
      };
}

class AdditiveTitle {
  final String ar;
  final String en;

  AdditiveTitle({
    required this.ar,
    required this.en,
  });

  factory AdditiveTitle.fromJson(Map<String, dynamic> json) => AdditiveTitle(
        ar: json["ar"],
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "ar": ar,
        "en": en,
      };
}

class Meal {
  final Category category;
  final String id;
  final List<Image> images;
  final double price;
  final double rating;
  final Restaurant restaurant;
  final MealTitle title;

  Meal({
    required this.category,
    required this.id,
    required this.images,
    required this.price,
    required this.rating,
    required this.restaurant,
    required this.title,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        category: Category.fromJson(json["category"]),
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        price: json["price"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        restaurant: Restaurant.fromJson(json["restaurant"]),
        title: MealTitle.fromJson(json["title"]),
      );

  Map<String, dynamic> toJson() => {
        "category": category.toJson(),
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "price": price,
        "rating": rating,
        "restaurant": restaurant.toJson(),
        "title": title.toJson(),
      };
}

class Category {
  final String id;
  final CategoryTitle title;

  Category({
    required this.id,
    required this.title,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        title: CategoryTitle.fromJson(json["title"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title.toJson(),
      };
}

class CategoryTitle {
  final String ar;
  final String en;

  CategoryTitle({
    required this.ar,
    required this.en,
  });

  factory CategoryTitle.fromJson(Map<String, dynamic> json) => CategoryTitle(
        ar: json["ar"],
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "ar": ar,
        "en": en,
      };
}

class Image {
  final String publicId;
  final String url;

  Image({
    required this.publicId,
    required this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        publicId: json["publicId"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "publicId": publicId,
        "url": url,
      };
}

class Restaurant {
  final String id;
  final String logo;
  final RestaurantTitle title;

  Restaurant({
    required this.id,
    required this.logo,
    required this.title,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["_id"],
        logo: json["logo"],
        title: RestaurantTitle.fromJson(json["title"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "logo": logo,
        "title": title.toJson(),
      };
}

class RestaurantTitle {
  final String ar;
  final String en;

  RestaurantTitle({
    required this.ar,
    required this.en,
  });

  factory RestaurantTitle.fromJson(Map<String, dynamic> json) =>
      RestaurantTitle(
        ar: json["ar"],
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "ar": ar,
        "en": en,
      };
}

class MealTitle {
  final String ar;
  final String en;

  MealTitle({
    required this.ar,
    required this.en,
  });

  factory MealTitle.fromJson(Map<String, dynamic> json) => MealTitle(
        ar: json["ar"],
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "ar": ar,
        "en": en,
      };
}

class Promotion {
  final String id;
  final String discountType;
  final int discountValue;
  final String name;

  Promotion({
    required this.id,
    required this.discountType,
    required this.discountValue,
    required this.name,
  });

  factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
        id: json["_id"],
        discountType: json["discountType"],
        discountValue: json["discountValue"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "discountType": discountType,
        "discountValue": discountValue,
        "name": name,
      };
}

class ShippingAddress {
  final String id;
  final String additionalInfo;
  final String addressTitle;
  final String city;
  final String country;
  final Location location;

  ShippingAddress({
    required this.id,
    required this.additionalInfo,
    required this.addressTitle,
    required this.city,
    required this.country,
    required this.location,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      ShippingAddress(
        id: json["_id"],
        additionalInfo: json["additionalInfo"],
        addressTitle: json["addressTitle"],
        city: json["city"],
        country: json["country"],
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "additionalInfo": additionalInfo,
        "addressTitle": addressTitle,
        "city": city,
        "country": country,
        "location": location.toJson(),
      };
}

class Location {
  final List<double> coordinates;
  final String type;

  Location({
    required this.coordinates,
    required this.type,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
        "type": type,
      };
}
