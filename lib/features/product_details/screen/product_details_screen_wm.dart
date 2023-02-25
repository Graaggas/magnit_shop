import 'package:elementary/elementary.dart';
import 'package:magnit_shop/features/product_details/screen/product_details_screen.dart';
import 'package:magnit_shop/features/product_details/screen/product_details_screen_model.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/product/product.dart';

/// Factory for [ProductDetailsScreenWM].
ProductDetailsScreenWM createProductDetailsScreenWM(Product product) => ProductDetailsScreenWM(
      model: ProductDetailsScreenModel(),
      product: product,
    );

/// Widget model for [ProductDetailsScreen].
class ProductDetailsScreenWM extends WidgetModel<ProductDetailsScreen, ProductDetailsScreenModel>
    implements IProductDetailsScreenWM {
  final Product _product;

  @override
  String get productName => _product.productName;

  ProductDetailsScreenWM({required ProductDetailsScreenModel model, required Product product})
      : _product = product,
        super(model);
}

/// Interface for [ProductDetailsScreenWM].
abstract class IProductDetailsScreenWM {
  /// Shop name.
  String get productName;
}
