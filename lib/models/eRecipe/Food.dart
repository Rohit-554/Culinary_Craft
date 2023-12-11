import '../recipes/EnumValues.dart';
import 'Nutrients.dart';

class Food {
  String foodId;
  String uri;
  String label;
  String knownAs;
  Nutrients nutrients;
  Category category;
  CategoryLabel categoryLabel;
  String? image;

  Food({
    required this.foodId,
    required this.uri,
    required this.label,
    required this.knownAs,
    required this.nutrients,
    required this.category,
    required this.categoryLabel,
    this.image,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    foodId: json["foodId"],
    uri: json["uri"],
    label: json["label"],
    knownAs: json["knownAs"],
    nutrients: Nutrients.fromJson(json["nutrients"]),
    category: categoryValues.map[json["category"]]!,
    categoryLabel: categoryLabelValues.map[json["categoryLabel"]]!,
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "foodId": foodId,
    "uri": uri,
    "label": label,
    "knownAs": knownAs,
    "nutrients": nutrients.toJson(),
    "category": categoryValues.reverse[category],
    "categoryLabel": categoryLabelValues.reverse[categoryLabel],
    "image": image,
  };
}

enum Category {
  GENERIC_FOODS
}

final categoryValues = EnumValues({
  "Generic foods": Category.GENERIC_FOODS
});

enum CategoryLabel {
  FOOD
}

final categoryLabelValues = EnumValues({
  "food": CategoryLabel.FOOD
});
