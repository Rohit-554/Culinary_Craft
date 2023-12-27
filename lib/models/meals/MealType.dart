import 'MealItem.dart';

class MealType {
  List<MealItem>? meals;

  MealType({this.meals});

  MealType.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      meals = <MealItem>[];
      json['meals'].forEach((v) {
        meals!.add(MealItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.meals != null) {
      data['meals'] = this.meals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}