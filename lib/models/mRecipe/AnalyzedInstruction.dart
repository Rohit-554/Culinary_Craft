class AnalyzedInstruction {
  String name;
  List<Step> steps;

  AnalyzedInstruction({
    required this.name,
    required this.steps,
  });

  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) => AnalyzedInstruction(
    name: json["name"],
    steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
  };
}

class Step {
  int number;
  String step;
  List<Ent> ingredients;
  List<Ent> equipment;

  Step({
    required this.number,
    required this.step,
    required this.ingredients,
    required this.equipment,
  });

  factory Step.fromJson(Map<String, dynamic> json) => Step(
    number: json["number"],
    step: json["step"],
    ingredients: List<Ent>.from(json["ingredients"].map((x) => Ent.fromJson(x))),
    equipment: List<Ent>.from(json["equipment"].map((x) => Ent.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "step": step,
    "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
    "equipment": List<dynamic>.from(equipment.map((x) => x.toJson())),
  };
}

class Ent {
  int id;
  String name;
  String localizedName;
  String image;

  Ent({
    required this.id,
    required this.name,
    required this.localizedName,
    required this.image,
  });

  factory Ent.fromJson(Map<String, dynamic> json) => Ent(
    id: json["id"],
    name: json["name"],
    localizedName: json["localizedName"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "localizedName": localizedName,
    "image": image,
  };
}