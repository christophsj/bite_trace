import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/mapper/product_to_food_mapper.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/routing/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

@RoutePage()
class BarcodeScanScreen extends ConsumerStatefulWidget {
  const BarcodeScanScreen({
    required this.log,
    required this.selectedMealIndex,
    super.key,
  });

  final DiaryEntry log;
  final int selectedMealIndex;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends ConsumerState<BarcodeScanScreen>
    with TickerProviderStateMixin {
  late Future<List<Product>> search;

  @override
  void initState() {
    // search = ref.read(openFoodServiceProvider).searchByBarcode();
    search = Future.value([Product(productName: '123')]);
    super.initState();
  }

  void onSearchComplete(Product? p) {
    if (p == null) {
      ref
          .read(snackbarServiceProvider)
          .showBasic('scanning failed or not found :(');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode scan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<List<Product>>(
              future: search,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (!snapshot.hasData && snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('nothing found :('),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (final p in snapshot.data!)
                          ElevatedButton(
                            onPressed: () {
                              context.pushRoute(
                                FoodDetailsRoute(
                                  initialMealIndex: widget.selectedMealIndex,
                                  log: widget.log,
                                  food: ProductToFoodMapper.productToFood(p, 1),
                                ),
                              );
                            },
                            child: Text('View ${p.productName}'),
                          ),
                        IconButton(
                          icon: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Rescan'),
                              Icon(Icons.refresh),
                            ],
                          ),
                          onPressed: () {
                            setState(() {
                              search = ref
                                  .read(openFoodServiceProvider)
                                  .searchByBarcode();
                            });
                          },
                        ),
                      ],
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
