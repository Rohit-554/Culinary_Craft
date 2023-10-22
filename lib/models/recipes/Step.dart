class Step {
  int number;
  String step;
  List<dynamic> ingredients;
  List<dynamic> equipment;

  Step({
    required this.number,
    required this.step,
    required this.ingredients,
    required this.equipment,
  });

  factory Step.fromJson(Map<String, dynamic> json) => Step(
    number: json["number"],
    step: json["step"],
    ingredients: List<dynamic>.from(json["ingredients"].map((x) => x)),
    equipment: List<dynamic>.from(json["equipment"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "step": step,
    "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
    "equipment": List<dynamic>.from(equipment.map((x) => x)),
  };
}
