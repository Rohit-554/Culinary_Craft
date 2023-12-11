import 'dart:convert';

import 'Hint.dart';
import 'Links.dart';

ERecipe eRecipeFromJson(String str) => ERecipe.fromJson(json.decode(str));

String eRecipeToJson(ERecipe data) => json.encode(data.toJson());

class ERecipe {
  String text;
  List<dynamic> parsed;
  List<Hint> hints;
  Links links;

  ERecipe({
    required this.text,
    required this.parsed,
    required this.hints,
    required this.links,
  });

  factory ERecipe.fromJson(Map<String, dynamic> json) => ERecipe(
    text: json["text"],
    parsed: List<dynamic>.from(json["parsed"].map((x) => x)),
    hints: List<Hint>.from(json["hints"].map((x) => Hint.fromJson(x))),
    links: Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "parsed": List<dynamic>.from(parsed.map((x) => x)),
    "hints": List<dynamic>.from(hints.map((x) => x.toJson())),
    "_links": links.toJson(),
  };
}











