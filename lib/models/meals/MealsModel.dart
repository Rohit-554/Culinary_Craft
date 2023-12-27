import 'MealDetail.dart';

class MealsModel {
  List<MealsDetail>? meals;

  MealsModel({this.meals});

  MealsModel.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      meals = <MealsDetail>[];
      if (json['meals'] is List) {
        // Handle the case where 'meals' is a list
        json['meals'].forEach((v) {
          meals!.add(MealsDetail.fromJson(v));
        });
      } else if (json['meals'] is Map) {
        // Handle the case where 'meals' is a map (string)
        meals!.add(MealsDetail.fromJson(json['meals']));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meals != null) {
      data['meals'] = this.meals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



