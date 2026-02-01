import 'package:flutter/foundation.dart';
import 'package:formation_flutter/model/product.dart';

/// ChangeNotifier qui gère l'état du produit.
/// Expose un objet Product qui peut être null au départ,
/// puis chargé via loadProduct().
class ProductNotifier extends ChangeNotifier {
  Product? _product;

  /// Getter pour accéder au produit.
  Product? get product => _product;

  /// Constructeur qui déclenche le chargement automatique.
  ProductNotifier() {
    loadProduct();
  }

  /// Charge le produit (pour l'instant avec des données simulées).
  /// Sera remplacé par un appel API dans la branche requête.
  void loadProduct() {
    _product = generateProduct();
    notifyListeners();
  }
}
