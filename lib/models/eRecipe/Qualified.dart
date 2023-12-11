import 'Qualifier.dart';

class Qualified {
  List<Qualifier> qualifiers;
  double weight;

  Qualified({
    required this.qualifiers,
    required this.weight,
  });

  factory Qualified.fromJson(Map<String, dynamic> json) => Qualified(
    qualifiers: List<Qualifier>.from(json["qualifiers"].map((x) => Qualifier.fromJson(x))),
    weight: json["weight"],
  );

  Map<String, dynamic> toJson() => {
    "qualifiers": List<dynamic>.from(qualifiers.map((x) => x.toJson())),
    "weight": weight,
  };
}
