import 'package:barcode_scan2/gen/protos/protos.pbserver.dart';
import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:bite_trace/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class OpenFoodService {
  OpenFoodService({required this.ref}) {
    OpenFoodAPIConfiguration.userAgent = UserAgent(
      name: 'bitetrace',
    );
  }

  final Ref ref;

  Future<List<Product>> searchByBarcode() async {
    final result = await BarcodeScanner.scan();
    if (result.type == ResultType.Barcode) {
      final searchResult = await OpenFoodAPIClient.searchProducts(
        null,
        ProductSearchQueryConfiguration(
          parametersList: <Parameter>[
            BarcodeParameter(result.rawContent),
          ],
          version: ProductQueryVersion.v3,
        ),
      );
      return searchResult.products?.toList() ?? <Product>[];
    } else if (result.type == ResultType.Error) {
      ref.read(snackbarServiceProvider).showBasic(
            'Error scanning barcode: ${result.rawContent}',
          );
      return [];
    }
    ref
        .read(snackbarServiceProvider)
        .showBasic('scanning failed or not found :(');
    return [];
  }

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
