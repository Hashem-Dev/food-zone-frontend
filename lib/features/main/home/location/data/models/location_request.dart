import 'dart:convert';

/// Converts a [LocationRequest] object to a JSON string.
///
/// @param data The [LocationRequest] object to convert.
/// @returns A JSON string representation of the [LocationRequest] object.
String locationRequestToJson(LocationRequest data) =>
    json.encode(data.toJson());

/// A model class representing a location request.
class LocationRequest {
  /// The country of the location.
  final String country;

  /// The city of the location.
  final String city;

  /// The geographical location coordinates.
  final Location location;

  /// Additional information about the location.
  final String additionalInfo;

  /// The title of the address.
  final String addressTitle;

  /// Creates a [LocationRequest] instance.
  ///
  /// @param country The country of the location.
  /// @param city The city of the location.
  /// @param location The geographical location coordinates.
  /// @param additionalInfo Additional information about the location.
  /// @param addressTitle The title of the address.
  LocationRequest({
    required this.country,
    required this.city,
    required this.location,
    required this.additionalInfo,
    required this.addressTitle,
  });

  /// Converts the [LocationRequest] object to a JSON map.
  ///
  /// @returns A JSON map representation of the [LocationRequest] object.
  Map<String, dynamic> toJson() => {
        "country": country,
        "city": city,
        "location": location.toJson(),
        "additionalInfo": additionalInfo,
        "addressTitle": addressTitle,
      };
}

/// A model class representing geographical location coordinates.
class Location {
  /// The list of coordinates (latitude and longitude).
  final List<double> coordinates;

  /// Creates a [Location] instance.
  ///
  /// @param coordinates The list of coordinates (latitude and longitude).
  Location({
    required this.coordinates,
  });

  /// Creates a [Location] instance from a JSON map.
  ///
  /// @param json The JSON map to convert.
  /// @returns A [Location] instance.
  factory Location.fromJson(Map<String, dynamic> json) => Location(
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
      );

  /// Converts the [Location] object to a JSON map.
  ///
  /// @returns A JSON map representation of the [Location] object.
  Map<String, dynamic> toJson() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}
