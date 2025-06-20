import 'dart:convert';

/// Converts a JSON string into a [LocationResponse] object.
///
/// @param str The JSON string to be converted.
/// @returns A [LocationResponse] object.
LocationResponse locationResponseFromJson(String str) {
  return LocationResponse.fromJson(json.decode(str));
}

/// Converts a [LocationResponse] object into a JSON string.
///
/// @param data The [LocationResponse] object to be converted.
/// @returns A JSON string.
String locationResponseToJson(LocationResponse data) {
  return json.encode(data.toJson());
}

/// Converts a [Location] object into a JSON string.
///
/// @param data The [Location] object to be converted.
/// @returns A JSON string.
String locationCoordsToJson(Location data) {
  return jsonEncode(data.toJson());
}

/// Converts a JSON string into a [Location] object.
///
/// @param str The JSON string to be converted.
/// @returns A [Location] object.
Location locationCoordsFromJson(String str) {
  return Location.fromJson(json.decode(str));
}

/// Represents the response containing location data and pagination results.
class LocationResponse {
  /// The pagination results.
  final PaginationResults paginationResults;

  /// The list of location results.
  final List<LocationResult> result;

  /// Creates a [LocationResponse] object.
  ///
  /// @param paginationResults The pagination results.
  /// @param result The list of location results.
  LocationResponse({
    required this.paginationResults,
    required this.result,
  });

  /// Creates a [LocationResponse] object from a JSON map.
  ///
  /// @param json The JSON map to be converted.
  /// @returns A [LocationResponse] object.
  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      LocationResponse(
        paginationResults:
            PaginationResults.fromJson(json["paginationResults"]),
        result: List<LocationResult>.from(
            json["result"].map((x) => LocationResult.fromJson(x))),
      );

  /// Converts the [LocationResponse] object into a JSON map.
  ///
  /// @returns A JSON map.
  Map<String, dynamic> toJson() => {
        "paginationResults": paginationResults.toJson(),
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

/// Represents the pagination results.
class PaginationResults {
  /// The current index.
  final int currentIndex;

  /// The limit of results per page.
  final int limit;

  /// The total number of pages.
  final int numberOfPages;

  /// Creates a [PaginationResults] object.
  ///
  /// @param currentIndex The current index.
  /// @param limit The limit of results per page.
  /// @param numberOfPages The total number of pages.
  PaginationResults({
    required this.currentIndex,
    required this.limit,
    required this.numberOfPages,
  });

  /// Creates a [PaginationResults] object from a JSON map.
  ///
  /// @param json The JSON map to be converted.
  /// @returns A [PaginationResults] object.
  factory PaginationResults.fromJson(Map<String, dynamic> json) =>
      PaginationResults(
        currentIndex: json["currentIndex"],
        limit: json["limit"],
        numberOfPages: json["numberOfPages"],
      );

  /// Converts the [PaginationResults] object into a JSON map.
  ///
  /// @returns A JSON map.
  Map<String, dynamic> toJson() => {
        "currentIndex": currentIndex,
        "limit": limit,
        "numberOfPages": numberOfPages,
      };
}

/// Represents a location result.
class LocationResult {
  /// The location details.
  final Location location;

  /// The unique identifier.
  final String id;

  /// The user associated with the location.
  final String user;

  /// The country of the location.
  final String country;

  /// The city of the location.
  final String city;

  /// The street of the location.
  final String street;

  /// The apartment of the location.
  final String apartment;

  /// Indicates if this is the default address.
  final bool defaultAddress;

  /// The title of the address.
  final String addressTitle;

  /// Additional information about the location.
  final String additionalInfo;

  /// The date and time when the location was created.
  final DateTime createdAt;

  /// Creates a [LocationResult] object.
  ///
  /// @param location The location details.
  /// @param id The unique identifier.
  /// @param user The user associated with the location.
  /// @param country The country of the location.
  /// @param city The city of the location.
  /// @param street The street of the location.
  /// @param apartment The apartment of the location.
  /// @param defaultAddress Indicates if this is the default address.
  /// @param addressTitle The title of the address.
  /// @param additionalInfo Additional information about the location.
  /// @param createdAt The date and time when the location was created.
  LocationResult({
    required this.location,
    required this.id,
    required this.user,
    required this.country,
    required this.city,
    required this.street,
    required this.apartment,
    required this.defaultAddress,
    required this.addressTitle,
    required this.additionalInfo,
    required this.createdAt,
  });

  /// Creates a [LocationResult] object from a JSON map.
  ///
  /// @param json The JSON map to be converted.
  /// @returns A [LocationResult] object.
  factory LocationResult.fromJson(Map<String, dynamic> json) => LocationResult(
        location: Location.fromJson(json["location"]),
        id: json["_id"],
        user: json["user"],
        country: json["country"],
        city: json["city"],
        street: json["street"],
        apartment: json["apartment"],
        defaultAddress: json["defaultAddress"],
        addressTitle: json["addressTitle"],
        additionalInfo: json["additionalInfo"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  /// Converts the [LocationResult] object into a JSON map.
  ///
  /// @returns A JSON map.
  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "_id": id,
        "user": user,
        "country": country,
        "city": city,
        "street": street,
        "apartment": apartment,
        "defaultAddress": defaultAddress,
        "addressTitle": addressTitle,
        "additionalInfo": additionalInfo,
        "createdAt": createdAt.toIso8601String(),
      };
}

/// Represents a location with coordinates and type.
class Location {
  /// The coordinates of the location.
  final List<double> coordinates;

  /// The type of the location.
  final String type;

  /// Creates a [Location] object.
  ///
  /// @param coordinates The coordinates of the location.
  /// @param type The type of the location.
  Location({
    required this.coordinates,
    required this.type,
  });

  /// Creates a [Location] object from a JSON map.
  ///
  /// @param json The JSON map to be converted.
  /// @returns A [Location] object.
  factory Location.fromJson(Map<String, dynamic> json) => Location(
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
        type: json["type"],
      );

  /// Converts the [Location] object into a JSON map.
  ///
  /// @returns A JSON map.
  Map<String, dynamic> toJson() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
        "type": type,
      };
}
