class MealItem {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  MealItem({this.strMeal, this.strMealThumb, this.idMeal});

  MealItem.fromJson(Map<String, dynamic> json) {
    strMeal = json['strMeal'];
    strMealThumb = json['strMealThumb'];
    idMeal = json['idMeal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['strMeal'] = strMeal;
    data['strMealThumb'] = strMealThumb;
    data['idMeal'] = idMeal;
    return data;
  }
}