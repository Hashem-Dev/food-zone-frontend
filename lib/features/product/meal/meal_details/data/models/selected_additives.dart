import 'package:food_zone/features/product/meal/meal_details/data/models/meal_details.dart';

class SelectedAdditives {
  final String additiveId;
  final Additive additives;
  bool additiveSelected;

  SelectedAdditives({
    required this.additiveId,
    required this.additives,
    this.additiveSelected = false,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SelectedAdditives && other.additiveId == additiveId;
  }

  @override
  int get hashCode => additiveId.hashCode;

  Map<String, dynamic> toJson() {
    return {
      'additiveId': additiveId,
      'additives': additives.toJson(),
      'additiveSelected': additiveSelected,
    };
  }

  factory SelectedAdditives.fromJson(Map<String, dynamic> json) {
    return SelectedAdditives(
      additiveId: json['additiveId'],
      additives: Additive.fromJson(json['additives']),
      additiveSelected: json['additiveSelected'],
    );
  }
}
