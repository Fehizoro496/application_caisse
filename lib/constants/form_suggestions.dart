import 'package:application_caisse/constants/products_data.dart';

/// Constantes pour les suggestions d'autocompletion dans les formulaires

class ProductSuggestion {
  final String designation;
  final int prix;

  const ProductSuggestion({
    required this.designation,
    required this.prix,
  });
}

class FormSuggestions {
  FormSuggestions._();

  /// Suggestions de produits avec leur prix par defaut
  static const List<ProductSuggestion> produits = productsData;

  /// Recupere le prix par defaut pour une designation donnee
  static int? getprix(String designation) {
    final produit = produits
        .where(
          (p) => p.designation.toLowerCase() == designation.toLowerCase(),
        )
        .firstOrNull;
    return produit?.prix;
  }

  /// Recupere les designations qui correspondent a la recherche
  static List<ProductSuggestion> searchProduits(String query) {
    if (query.isEmpty) return produits;
    return produits
        .where((p) => p.designation.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
