import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/description_text.dart';

class NutritionalMealInformation extends StatelessWidget {
  const NutritionalMealInformation({
    super.key,
    this.calories,
    this.protein,
    this.carbs,
    this.fat,
  });

  final String? calories;
  final String? protein;
  final String? carbs;
  final String? fat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MealDescriptionText(text: 'Calories : $calories'),
            MealDescriptionText(text: 'Protein : $protein'),
          ],
        ),
        addVerticalSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MealDescriptionText(text: 'Carbs : $carbs'),
            MealDescriptionText(text: 'Fat : $fat'),
          ],
        ),
      ],
    );
  }
}
