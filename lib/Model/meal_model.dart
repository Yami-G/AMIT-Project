class MealModel {
  String mealName;
  String mealPrice;
  String mealRate;
  String mealTime;
  String mealImage;
  bool? isFavorite = false;

  MealModel({
    required this.mealName,
    required this.mealPrice,
    required this.mealRate,
    required this.mealTime,
    required this.mealImage,
    this.isFavorite,
  });
}
