import 'package:fruits_app/entities/nutrition.dart';

class Fruit {
  String? name;
  String? taste;
  String? description;
  String? thumbnail;
  String? imageName;
  Nutrition? nutrition;

  Fruit object(Map<String, dynamic> json) {
    name = json["name"];
    thumbnail="$name.png";
    imageName="${name}Big.jpg";
    taste = json["taste"];
    description = json["description"];
    nutrition = json["nutrition"] == null ? null : Nutrition().object(json["nutrition"]);
    return this;
  }
}