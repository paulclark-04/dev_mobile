/// Classe racine de la réponse API.
/// Contient soit un produit, soit une erreur.
class ApiResponse {
  final ApiProduct? response;
  final String? error;

  ApiResponse({this.response, this.error});

  factory ApiResponse.fromJSON(Map<String, dynamic> json) => ApiResponse(
        response: json['response'] != null
            ? ApiProduct.fromJSON(json['response'])
            : null,
        error: json['error'],
      );
}

/// Représentation du produit tel que retourné par l'API.
class ApiProduct {
  final String barcode;
  final String? name;
  final String? altName;
  final ApiPictures? pictures;
  final String? quantity;
  final List<String>? brands;
  final List<String>? manufacturingCountries;
  final String? nutriScore;
  final int? novaScore;
  final String? ecoScoreGrade;
  final ApiIngredients? ingredients;
  final ApiNutrientLevels? nutrientLevels;
  final ApiNutritionFacts? nutritionFacts;
  final ApiLevels? levels;
  final ApiTraces? traces;
  final Map<String, String>? additives;
  final ApiAllergens? allergens;
  final ApiAnalysis? analysis;

  ApiProduct({
    required this.barcode,
    this.name,
    this.altName,
    this.pictures,
    this.quantity,
    this.brands,
    this.manufacturingCountries,
    this.nutriScore,
    this.novaScore,
    this.ecoScoreGrade,
    this.ingredients,
    this.nutrientLevels,
    this.nutritionFacts,
    this.levels,
    this.traces,
    this.additives,
    this.allergens,
    this.analysis,
  });

  factory ApiProduct.fromJSON(Map<String, dynamic> json) => ApiProduct(
        barcode: json['barcode'] ?? '',
        name: json['name'],
        altName: json['altName'],
        pictures: json['pictures'] != null
            ? ApiPictures.fromJSON(json['pictures'])
            : null,
        quantity: json['quantity'],
        brands: (json['brands'] as List<dynamic>?)?.cast<String>(),
        manufacturingCountries:
            (json['manufacturingCountries'] as List<dynamic>?)?.cast<String>(),
        nutriScore: json['nutriScore'],
        novaScore: json['novaScore'],
        ecoScoreGrade: json['ecoScoreGrade'],
        ingredients: json['ingredients'] != null
            ? ApiIngredients.fromJSON(json['ingredients'])
            : null,
        nutrientLevels: json['nutrientLevels'] != null
            ? ApiNutrientLevels.fromJSON(json['nutrientLevels'])
            : null,
        nutritionFacts: json['nutritionFacts'] != null
            ? ApiNutritionFacts.fromJSON(json['nutritionFacts'])
            : null,
        levels:
            json['levels'] != null ? ApiLevels.fromJSON(json['levels']) : null,
        traces:
            json['traces'] != null ? ApiTraces.fromJSON(json['traces']) : null,
        additives:
            (json['additives'] as Map<String, dynamic>?)?.cast<String, String>(),
        allergens: json['allergens'] != null
            ? ApiAllergens.fromJSON(json['allergens'])
            : null,
        analysis: json['analysis'] != null
            ? ApiAnalysis.fromJSON(json['analysis'])
            : null,
      );
}

/// Images du produit.
class ApiPictures {
  final String? product;
  final String? front;
  final String? ingredients;
  final String? nutrition;

  ApiPictures({this.product, this.front, this.ingredients, this.nutrition});

  factory ApiPictures.fromJSON(Map<String, dynamic> json) => ApiPictures(
        product: json['product'],
        front: json['front'],
        ingredients: json['ingredients'],
        nutrition: json['nutrition'],
      );
}

/// Informations sur les ingrédients.
class ApiIngredients {
  final bool? containsPalmOil;
  final List<String>? list;
  final String? withAllergens;

  ApiIngredients({this.containsPalmOil, this.list, this.withAllergens});

  factory ApiIngredients.fromJSON(Map<String, dynamic> json) => ApiIngredients(
        containsPalmOil: json['containsPalmOil'],
        list: (json['list'] as List<dynamic>?)?.cast<String>(),
        withAllergens: json['withAllergens'],
      );
}

/// Niveaux de nutriments (fat, salt, saturatedFat, sugars).
class ApiNutrientLevels {
  final ApiNutrientLevel? fat;
  final ApiNutrientLevel? salt;
  final ApiNutrientLevel? saturatedFat;
  final ApiNutrientLevel? sugars;

  ApiNutrientLevels({this.fat, this.salt, this.saturatedFat, this.sugars});

  factory ApiNutrientLevels.fromJSON(Map<String, dynamic> json) =>
      ApiNutrientLevels(
        fat: json['fat'] != null ? ApiNutrientLevel.fromJSON(json['fat']) : null,
        salt:
            json['salt'] != null ? ApiNutrientLevel.fromJSON(json['salt']) : null,
        saturatedFat: json['saturatedFat'] != null
            ? ApiNutrientLevel.fromJSON(json['saturatedFat'])
            : null,
        sugars: json['sugars'] != null
            ? ApiNutrientLevel.fromJSON(json['sugars'])
            : null,
      );
}

/// Un niveau de nutriment individuel.
class ApiNutrientLevel {
  final String? level;
  final double? per100g;

  ApiNutrientLevel({this.level, this.per100g});

  factory ApiNutrientLevel.fromJSON(Map<String, dynamic> json) =>
      ApiNutrientLevel(
        level: json['level'],
        per100g: (json['per100g'] as num?)?.toDouble(),
      );
}

/// Faits nutritionnels.
class ApiNutritionFacts {
  final String? servingSize;
  final ApiNutriment? fat;
  final ApiNutriment? saturatedFat;
  final ApiNutriment? carbohydrate;
  final ApiNutriment? sugar;
  final ApiNutriment? fiber;
  final ApiNutriment? proteins;
  final ApiNutriment? sodium;
  final ApiNutriment? salt;
  final ApiNutriment? energy;

  ApiNutritionFacts({
    this.servingSize,
    this.fat,
    this.saturatedFat,
    this.carbohydrate,
    this.sugar,
    this.fiber,
    this.proteins,
    this.sodium,
    this.salt,
    this.energy,
  });

  factory ApiNutritionFacts.fromJSON(Map<String, dynamic> json) =>
      ApiNutritionFacts(
        servingSize: json['servingSize'],
        fat: json['fat'] != null ? ApiNutriment.fromJSON(json['fat']) : null,
        saturatedFat: json['saturatedFat'] != null
            ? ApiNutriment.fromJSON(json['saturatedFat'])
            : null,
        carbohydrate: json['carbohydrate'] != null
            ? ApiNutriment.fromJSON(json['carbohydrate'])
            : null,
        sugar:
            json['sugar'] != null ? ApiNutriment.fromJSON(json['sugar']) : null,
        fiber:
            json['fiber'] != null ? ApiNutriment.fromJSON(json['fiber']) : null,
        proteins: json['proteins'] != null
            ? ApiNutriment.fromJSON(json['proteins'])
            : null,
        sodium: json['sodium'] != null
            ? ApiNutriment.fromJSON(json['sodium'])
            : null,
        salt: json['salt'] != null ? ApiNutriment.fromJSON(json['salt']) : null,
        energy: json['energy'] != null
            ? ApiNutriment.fromJSON(json['energy'])
            : null,
      );
}

/// Un nutriment individuel avec unité et valeurs.
class ApiNutriment {
  final String? unit;
  final String? perServing;
  final String? per100g;

  ApiNutriment({this.unit, this.perServing, this.per100g});

  factory ApiNutriment.fromJSON(Map<String, dynamic> json) => ApiNutriment(
        unit: json['unit'],
        perServing: json['perServing']?.toString(),
        per100g: json['per100g']?.toString(),
      );
}

/// Niveaux détaillés pour le Nutri-Score.
class ApiLevels {
  final ApiLevel? energy;
  final ApiLevel? fiber;
  final ApiLevel? fruitsVegetablesLegumes;
  final ApiLevel? proteins;
  final ApiLevel? salt;
  final ApiLevel? saturatedFat;
  final ApiLevel? sugars;

  ApiLevels({
    this.energy,
    this.fiber,
    this.fruitsVegetablesLegumes,
    this.proteins,
    this.salt,
    this.saturatedFat,
    this.sugars,
  });

  factory ApiLevels.fromJSON(Map<String, dynamic> json) => ApiLevels(
        energy:
            json['energy'] != null ? ApiLevel.fromJSON(json['energy']) : null,
        fiber: json['fiber'] != null ? ApiLevel.fromJSON(json['fiber']) : null,
        fruitsVegetablesLegumes: json['fruitsVegetablesLegumes'] != null
            ? ApiLevel.fromJSON(json['fruitsVegetablesLegumes'])
            : null,
        proteins:
            json['proteins'] != null ? ApiLevel.fromJSON(json['proteins']) : null,
        salt: json['salt'] != null ? ApiLevel.fromJSON(json['salt']) : null,
        saturatedFat: json['saturatedFat'] != null
            ? ApiLevel.fromJSON(json['saturatedFat'])
            : null,
        sugars:
            json['sugars'] != null ? ApiLevel.fromJSON(json['sugars']) : null,
      );
}

/// Un niveau individuel pour le calcul du Nutri-Score.
class ApiLevel {
  final double? points;
  final double? maxPoints;
  final String? unit;
  final double? value;
  final String? type;

  ApiLevel({this.points, this.maxPoints, this.unit, this.value, this.type});

  factory ApiLevel.fromJSON(Map<String, dynamic> json) => ApiLevel(
        points: (json['points'] as num?)?.toDouble(),
        maxPoints: (json['maxPoints'] as num?)?.toDouble(),
        unit: json['unit'],
        value: (json['value'] as num?)?.toDouble(),
        type: json['type'],
      );
}

/// Traces d'allergènes possibles.
class ApiTraces {
  final List<String>? list;

  ApiTraces({this.list});

  factory ApiTraces.fromJSON(Map<String, dynamic> json) => ApiTraces(
        list: (json['list'] as List<dynamic>?)?.cast<String>(),
      );
}

/// Allergènes contenus dans le produit.
class ApiAllergens {
  final List<String>? list;

  ApiAllergens({this.list});

  factory ApiAllergens.fromJSON(Map<String, dynamic> json) => ApiAllergens(
        list: (json['list'] as List<dynamic>?)?.cast<String>(),
      );
}

/// Analyse du produit (huile de palme, végan, végétarien).
class ApiAnalysis {
  final String? palmOil;
  final String? vegan;
  final String? vegetarian;

  ApiAnalysis({this.palmOil, this.vegan, this.vegetarian});

  factory ApiAnalysis.fromJSON(Map<String, dynamic> json) => ApiAnalysis(
        palmOil: json['palmOil'],
        vegan: json['vegan'],
        vegetarian: json['vegetarian'],
      );
}
