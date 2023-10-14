class Nutrition{
  int? calories;
  double? fat;
  double? sugar;
  double? carbohydrates;
  double? protein;

  Nutrition object(Map<String, dynamic> json) {
    calories = json["calories"] == null ? null : json["calories"] as int?;
    fat = json["fat"] == null ? null : json["fat"] as double?;
    sugar = json["sugar"] == null ? null : json["sugar"] as double?;
    carbohydrates = json["carbohydrates"] == null ? null : json["carbohydrates"] as double?;
    protein = json["protein"] == null ? null : json["protein"] as double?;
    return this;
  }
}