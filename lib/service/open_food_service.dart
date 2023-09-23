import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class OpenFoodService {
  OpenFoodService({required this.ref});

  final Ref ref;

  

  Future<SearchResult> searchFoods({
    required String query,
    int page = 0,
    int pageSize = 10,
  }) async {
    return OpenFoodAPIClient.searchProducts(
      null,
      ProductSearchQueryConfiguration(
        parametersList: <Parameter>[
          SearchTerms(terms: [query]),
          PageNumber(page: page),
          PageSize(size: pageSize),
        ],
        version: ProductQueryVersion.v3,
      ),
    );
  }
}
