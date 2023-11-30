import 'dart:convert';

import '../recipes/AnalyzedInstruction.dart';
import '../recipes/ExtendedIngredient.dart';

MRecipe mRecipeFromJson(String str) => MRecipe.fromJson(json.decode(str));

String mRecipeToJson(MRecipe data) => json.encode(data.toJson());

class MRecipe {
  List<Recipe> recipes;

  MRecipe({
    required this.recipes,
  });

  factory MRecipe.fromJson(Map<String, dynamic> json) => MRecipe(
    recipes: List<Recipe>.from(json["recipes"].map((x) => Recipe.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "recipes": List<dynamic>.from(recipes.map((x) => x.toJson())),
  };
}

class Recipe {
  bool vegetarian;
  bool vegan;
  bool glutenFree;
  bool dairyFree;
  bool veryHealthy;
  bool cheap;
  bool veryPopular;
  bool sustainable;
  bool lowFodmap;
  int weightWatcherSmartPoints;
  String gaps;
  int preparationMinutes;
  int cookingMinutes;
  int aggregateLikes;
  int healthScore;
  String creditsText;
  String sourceName;
  double pricePerServing;
  List<ExtendedIngredient> extendedIngredients;
  int id;
  String title;
  int readyInMinutes;
  int servings;
  String sourceUrl;
  String image;
  String imageType;
  String summary;
  List<String> cuisines;
  List<String> dishTypes;
  List<String> diets;
  List<dynamic> occasions;
  String instructions;
  List<AnalyzedInstruction> analyzedInstructions;
  dynamic originalId;
  double spoonacularScore;
  String spoonacularSourceUrl;

  Recipe({
    required this.vegetarian,
    required this.vegan,
    required this.glutenFree,
    required this.dairyFree,
    required this.veryHealthy,
    required this.cheap,
    required this.veryPopular,
    required this.sustainable,
    required this.lowFodmap,
    required this.weightWatcherSmartPoints,
    required this.gaps,
    required this.preparationMinutes,
    required this.cookingMinutes,
    required this.aggregateLikes,
    required this.healthScore,
    required this.creditsText,
    required this.sourceName,
    required this.pricePerServing,
    required this.extendedIngredients,
    required this.id,
    required this.title,
    required this.readyInMinutes,
    required this.servings,
    required this.sourceUrl,
    required this.image,
    required this.imageType,
    required this.summary,
    required this.cuisines,
    required this.dishTypes,
    required this.diets,
    required this.occasions,
    required this.instructions,
    required this.analyzedInstructions,
    required this.originalId,
    required this.spoonacularScore,
    required this.spoonacularSourceUrl,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    vegetarian: json["vegetarian"],
    vegan: json["vegan"],
    glutenFree: json["glutenFree"],
    dairyFree: json["dairyFree"],
    veryHealthy: json["veryHealthy"],
    cheap: json["cheap"],
    veryPopular: json["veryPopular"],
    sustainable: json["sustainable"],
    lowFodmap: json["lowFodmap"],
    weightWatcherSmartPoints: json["weightWatcherSmartPoints"],
    gaps: json["gaps"],
    preparationMinutes: json["preparationMinutes"],
    cookingMinutes: json["cookingMinutes"],
    aggregateLikes: json["aggregateLikes"],
    healthScore: json["healthScore"],
    creditsText: json["creditsText"],
    sourceName: json["sourceName"],
    pricePerServing: json["pricePerServing"]?.toDouble(),
    extendedIngredients: List<ExtendedIngredient>.from(json["extendedIngredients"].map((x) => ExtendedIngredient.fromJson(x))),
    id: json["id"],
    title: json["title"],
    readyInMinutes: json["readyInMinutes"],
    servings: json["servings"],
    sourceUrl: json["sourceUrl"],
    image: json["image"],
    imageType: json["imageType"],
    summary: json["summary"],
    cuisines: List<String>.from(json["cuisines"].map((x) => x)),
    dishTypes: List<String>.from(json["dishTypes"].map((x) => x)),
    diets: List<String>.from(json["diets"].map((x) => x)),
    occasions: List<dynamic>.from(json["occasions"].map((x) => x)),
    instructions: json["instructions"],
    analyzedInstructions: List<AnalyzedInstruction>.from(json["analyzedInstructions"].map((x) => AnalyzedInstruction.fromJson(x))),
    originalId: json["originalId"],
    spoonacularScore: json["spoonacularScore"]?.toDouble(),
    spoonacularSourceUrl: json["spoonacularSourceUrl"],
  );

  Map<String, dynamic> toJson() => {
    "vegetarian": vegetarian,
    "vegan": vegan,
    "glutenFree": glutenFree,
    "dairyFree": dairyFree,
    "veryHealthy": veryHealthy,
    "cheap": cheap,
    "veryPopular": veryPopular,
    "sustainable": sustainable,
    "lowFodmap": lowFodmap,
    "weightWatcherSmartPoints": weightWatcherSmartPoints,
    "gaps": gaps,
    "preparationMinutes": preparationMinutes,
    "cookingMinutes": cookingMinutes,
    "aggregateLikes": aggregateLikes,
    "healthScore": healthScore,
    "creditsText": creditsText,
    "sourceName": sourceName,
    "pricePerServing": pricePerServing,
    "extendedIngredients": List<dynamic>.from(extendedIngredients.map((x) => x.toJson())),
    "id": id,
    "title": title,
    "readyInMinutes": readyInMinutes,
    "servings": servings,
    "sourceUrl": sourceUrl,
    "image": image,
    "imageType": imageType,
    "summary": summary,
    "cuisines": List<dynamic>.from(cuisines.map((x) => x)),
    "dishTypes": List<dynamic>.from(dishTypes.map((x) => x)),
    "diets": List<dynamic>.from(diets.map((x) => x)),
    "occasions": List<dynamic>.from(occasions.map((x) => x)),
    "instructions": instructions,
    "analyzedInstructions": List<dynamic>.from(analyzedInstructions.map((x) => x.toJson())),
    "originalId": originalId,
    "spoonacularScore": spoonacularScore,
    "spoonacularSourceUrl": spoonacularSourceUrl,
  };
}
