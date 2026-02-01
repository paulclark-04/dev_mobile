import 'package:formation_flutter/api/api_response.dart';
import 'package:formation_flutter/model/product.dart';

/// Convertit un ApiProduct (données de l'API) en Product (modèle UI).
/// Cette séparation permet de ne pas impacter l'UI si l'API change.
Product convertApiProductToProduct(ApiProduct api) {
  return Product(
    barcode: api.barcode,
    name: api.name,
    altName: api.altName,
    picture: api.pictures?.product ?? api.pictures?.front,
    quantity: api.quantity,
    brands: api.brands,
    manufacturingCountries: api.manufacturingCountries,
    nutriScore: _parseNutriScore(api.nutriScore),
    novaScore: _parseNovaScore(api.novaScore),
    greenScore: _parseGreenScore(api.ecoScoreGrade),
    ingredients: api.ingredients?.list,
    ingredientsWithAllergens: api.ingredients?.withAllergens,
    traces: api.traces?.list,
    allergens: api.allergens?.list,
    additives: api.additives,
    ingredientsFromPalmOil: api.ingredients?.containsPalmOil,
    containsPalmOil: ProductAnalysis.fromString(api.analysis?.palmOil),
    isVegan: ProductAnalysis.fromString(api.analysis?.vegan),
    isVegetarian: ProductAnalysis.fromString(api.analysis?.vegetarian),
    nutriScoreLevels: _convertNutriScoreLevels(api.levels),
    nutrientLevels: _convertNutrientLevels(api.nutrientLevels),
    nutritionFacts: _convertNutritionFacts(api.nutritionFacts),
  );
}

/// Parse le Nutri-Score (A, B, C, D, E) depuis une chaîne.
ProductNutriScore _parseNutriScore(String? score) {
  return switch (score?.toUpperCase()) {
    'A' => ProductNutriScore.A,
    'B' => ProductNutriScore.B,
    'C' => ProductNutriScore.C,
    'D' => ProductNutriScore.D,
    'E' => ProductNutriScore.E,
    _ => ProductNutriScore.unknown,
  };
}

/// Parse le Nova Score (1-4) depuis un entier.
ProductNovaScore _parseNovaScore(int? score) {
  return switch (score) {
    1 => ProductNovaScore.group1,
    2 => ProductNovaScore.group2,
    3 => ProductNovaScore.group3,
    4 => ProductNovaScore.group4,
    _ => ProductNovaScore.unknown,
  };
}

/// Parse le Green Score (Eco-Score) depuis une lettre.
ProductGreenScore _parseGreenScore(String? grade) {
  return switch (grade?.toUpperCase()) {
    'A+' => ProductGreenScore.APlus,
    'A' => ProductGreenScore.A,
    'B' => ProductGreenScore.B,
    'C' => ProductGreenScore.C,
    'D' => ProductGreenScore.D,
    'E' => ProductGreenScore.E,
    'F' => ProductGreenScore.F,
    _ => ProductGreenScore.unknown,
  };
}

/// Convertit le type de niveau API en type Product.
ProductNutriScoreLevelType _parseLevelType(String? type) {
  return switch (type) {
    'positive' => ProductNutriScoreLevelType.positive,
    'negative' => ProductNutriScoreLevelType.negative,
    _ => ProductNutriScoreLevelType.unknown,
  };
}

/// Convertit les niveaux du Nutri-Score de l'API vers le modèle Product.
ProductNutriScoreLevels? _convertNutriScoreLevels(ApiLevels? levels) {
  if (levels == null) return null;

  return ProductNutriScoreLevels(
    energy: _convertLevel(levels.energy),
    fiber: _convertLevel(levels.fiber),
    fruitsVegetablesLegumes: _convertLevel(levels.fruitsVegetablesLegumes),
    proteins: _convertLevel(levels.proteins),
    salt: _convertLevel(levels.salt),
    saturatedFat: _convertLevel(levels.saturatedFat),
    sugars: _convertLevel(levels.sugars),
  );
}

/// Convertit un niveau individuel de l'API vers le modèle Product.
ProductNutriScoreLevel? _convertLevel(ApiLevel? level) {
  if (level == null) return null;

  return ProductNutriScoreLevel(
    points: level.points ?? 0,
    maxPoints: level.maxPoints ?? 0,
    unit: level.unit ?? '',
    value: level.value ?? 0,
    type: _parseLevelType(level.type),
  );
}

/// Convertit les niveaux de nutriments de l'API vers le modèle Product.
NutrientLevels? _convertNutrientLevels(ApiNutrientLevels? levels) {
  if (levels == null) return null;

  return NutrientLevels(
    fat: levels.fat?.level,
    salt: levels.salt?.level,
    saturatedFat: levels.saturatedFat?.level,
    sugars: levels.sugars?.level,
  );
}

/// Convertit les faits nutritionnels de l'API vers le modèle Product.
NutritionFacts? _convertNutritionFacts(ApiNutritionFacts? facts) {
  if (facts == null) return null;

  return NutritionFacts(
    servingSize: facts.servingSize ?? '',
    fat: _convertNutriment(facts.fat),
    saturatedFat: _convertNutriment(facts.saturatedFat),
    carbohydrate: _convertNutriment(facts.carbohydrate),
    sugar: _convertNutriment(facts.sugar),
    fiber: _convertNutriment(facts.fiber),
    proteins: _convertNutriment(facts.proteins),
    sodium: _convertNutriment(facts.sodium),
    salt: _convertNutriment(facts.salt),
    energy: _convertNutriment(facts.energy),
  );
}

/// Convertit un nutriment individuel de l'API vers le modèle Product.
Nutriment? _convertNutriment(ApiNutriment? nutriment) {
  if (nutriment == null) return null;

  return Nutriment(
    unit: nutriment.unit ?? '',
    perServing: nutriment.perServing,
    per100g: nutriment.per100g,
  );
}
