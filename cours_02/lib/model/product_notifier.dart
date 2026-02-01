import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:formation_flutter/api/api_response.dart';
import 'package:formation_flutter/api/product_converter.dart';
import 'package:formation_flutter/model/product.dart';

/// ChangeNotifier qui gère l'état du produit.
/// Charge les données depuis l'API via Dio.
class ProductNotifier extends ChangeNotifier {
  Product? _product;
  final Dio _dio = Dio();

  /// Getter pour accéder au produit.
  Product? get product => _product;

  /// Constructeur qui déclenche le chargement automatique.
  ProductNotifier() {
    loadProduct();
  }

  /// Charge le produit depuis l'API.
  /// Utilise Dio pour la requête HTTP et jsonDecode pour le parsing.
  Future<void> loadProduct() async {
    const String barcode = '5000159484695'; // Code-barres du produit à charger
    const String url =
        'https://api.formation-flutter.fr/v2/getProduct?barcode=$barcode';

    try {
      // Requête GET vers l'API
      final response = await _dio.get(url);

      // Dio peut retourner soit une String soit une Map selon la configuration
      final Map<String, dynamic> json;
      if (response.data is String) {
        json = jsonDecode(response.data as String);
      } else {
        json = response.data as Map<String, dynamic>;
      }

      // Parsing de la réponse API
      final apiResponse = ApiResponse.fromJSON(json);

      // Si on a un produit valide, on le convertit et on notifie
      if (apiResponse.response != null) {
        _product = convertApiProductToProduct(apiResponse.response!);
        notifyListeners();
      } else if (apiResponse.error != null) {
        debugPrint('Erreur API: ${apiResponse.error}');
      }
    } catch (e) {
      debugPrint('Erreur lors du chargement du produit: $e');
    }
  }
}
