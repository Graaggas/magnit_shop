import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:magnit_shop/features/product_details/screen/product_details_screen_wm.dart';

/// Screen for product details.
class ProductDetailsScreen extends ElementaryWidget<ProductDetailsScreenWM> {
  const ProductDetailsScreen({
    Key? key,
    required WidgetModelFactory<ProductDetailsScreenWM> wmFactory,
  }) : super(
          wmFactory,
          key: key,
        );

  @override
  Widget build(IProductDetailsScreenWM wm) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 2,
              color: Colors.green[200],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  wm.productName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
