import '../recipes/Measures.dart';

class ExtendedIngredient {
  int id;
  String aisle;
  String image;
  String consistency;
  String name;
  String nameClean;
  String original;
  String originalName;
  double amount;
  String unit;
  List<String> meta;
  Measures measures;

  ExtendedIngredient({
    required this.id,
    required this.aisle,
    required this.image,
    required this.consistency,
    required this.name,
    required this.nameClean,
    required this.original,
    required this.originalName,
    required this.amount,
    required this.unit,
    required this.meta,
    required this.measures,
  });

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) => ExtendedIngredient(
    id: json["id"],
    aisle: json["aisle"],
    image: json["image"],
    consistency: json["consistency"],
    name: json["name"],
    nameClean: json["nameClean"],
    original: json["original"],
    originalName: json["originalName"],
    amount: json["amount"]?.toDouble(),
    unit: json["unit"],
    meta: List<String>.from(json["meta"].map((x) => x)),
    measures: Measures.fromJson(json["measures"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "aisle": aisle,
    "image": image,
    "consistency": consistency,
    "name": name,
    "nameClean": nameClean,
    "original": original,
    "originalName": originalName,
    "amount": amount,
    "unit": unit,
    "meta": List<dynamic>.from(meta.map((x) => x)),
    "measures": measures.toJson(),
  };
}
