import 'dart:convert';

List<PromotionsResponse> promotionsResponseFromJson(String str) =>
    List<PromotionsResponse>.from(
        json.decode(str).map((x) => PromotionsResponse.fromJson(x)));

String promotionsResponseToJson(List<PromotionsResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PromotionsResponse {
  final String id;
  final String code;
  final String name;
  final String description;
  final String discountType;
  final int discountValue;
  final List<Condition> condition;
  final DateTime startDate;
  final DateTime endDate;
  final int maxUses;
  final int usedCount;
  final bool isActive;

  PromotionsResponse({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.discountType,
    required this.discountValue,
    required this.condition,
    required this.startDate,
    required this.endDate,
    required this.maxUses,
    required this.usedCount,
    required this.isActive,
  });

  factory PromotionsResponse.fromJson(Map<String, dynamic> json) =>
      PromotionsResponse(
        id: json["_id"],
        code: json["code"],
        name: json["name"],
        description: json["description"],
        discountType: json["discountType"],
        discountValue: json["discountValue"],
        condition: List<Condition>.from(
            json["condition"].map((x) => Condition.fromJson(x))),
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        maxUses: json["maxUses"],
        usedCount: json["usedCount"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "code": code,
        "name": name,
        "description": description,
        "discountType": discountType,
        "discountValue": discountValue,
        "condition": List<dynamic>.from(condition.map((x) => x.toJson())),
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "maxUses": maxUses,
        "usedCount": usedCount,
        "isActive": isActive,
      };
}

class Condition {
  final String field;
  final Operator conditionOperator;
  final dynamic value;
  final String id;
  final String conditionTitle;

  Condition({
    required this.field,
    required this.conditionOperator,
    required this.value,
    required this.id,
    required this.conditionTitle,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        field: json["field"],
        conditionOperator: operatorValues.map[json["operator"]]!,
        value: json["value"],
        id: json["_id"],
        conditionTitle: json["conditionTitle"],
      );

  Map<String, dynamic> toJson() => {
        "field": field,
        "operator": operatorValues.reverse[conditionOperator],
        "value": value,
        "_id": id,
        "conditionTitle": conditionTitle,
      };
}

enum Operator { EMPTY, IN, OPERATOR }

final operatorValues = EnumValues(
    {">=": Operator.EMPTY, "in": Operator.IN, "==": Operator.OPERATOR});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
