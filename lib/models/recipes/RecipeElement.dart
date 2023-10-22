
import 'AnalyzedInstruction.dart';
import 'ExtendedIngredient.dart';

class RecipeElement {
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
  String license;
  String sourceName;
  double pricePerServing;
  List<ExtendedIngredient> extendedIngredients;
  int id;
  String title;
  String author;
  int readyInMinutes;
  int servings;
  String sourceUrl;
  String image;
  String imageType;
  String summary;
  List<String> cuisines;
  List<String> dishTypes;
  List<String> diets;
  List<String> occasions;
  String instructions;
  List<AnalyzedInstruction> analyzedInstructions;
  dynamic originalId;
  String spoonacularSourceUrl;

  RecipeElement({
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
    required this.license,
    required this.sourceName,
    required this.pricePerServing,
    required this.extendedIngredients,
    required this.id,
    required this.title,
    required this.author,
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
    required this.spoonacularSourceUrl,
  });

  factory RecipeElement.fromJson(Map<String, dynamic> json) => RecipeElement(
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
    license: json["license"],
    sourceName: json["sourceName"],
    pricePerServing: json["pricePerServing"]?.toDouble(),
    extendedIngredients: List<ExtendedIngredient>.from(json["extendedIngredients"].map((x) => ExtendedIngredient.fromJson(x))),
    id: json["id"],
    title: json["title"],
    author: json["author"],
    readyInMinutes: json["readyInMinutes"],
    servings: json["servings"],
    sourceUrl: json["sourceUrl"],
    image: json["image"],
    imageType: json["imageType"],
    summary: json["summary"],
    cuisines: List<String>.from(json["cuisines"].map((x) => x)),
    dishTypes: List<String>.from(json["dishTypes"].map((x) => x)),
    diets: List<String>.from(json["diets"].map((x) => x)),
    occasions: List<String>.from(json["occasions"].map((x) => x)),
    instructions: json["instructions"],
    analyzedInstructions: List<AnalyzedInstruction>.from(json["analyzedInstructions"].map((x) => AnalyzedInstruction.fromJson(x))),
    originalId: json["originalId"],
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
    "license": license,
    "sourceName": sourceName,
    "pricePerServing": pricePerServing,
    "extendedIngredients": List<dynamic>.from(extendedIngredients.map((x) => x.toJson())),
    "id": id,
    "title": title,
    "author": author,
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
    "spoonacularSourceUrl": spoonacularSourceUrl,
  };
}
