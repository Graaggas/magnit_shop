import 'package:magnit_shop/entity/parameter.dart';

/// Product.
class Product {
  /// Product id.
  final int id;

  /// Product name.
  final String productName;

  /// List of parameters.
  final List<Parameter> parameterList;

  /// Constructor for [Product].
  const Product({
    required this.id,
    required this.parameterList,
    required this.productName,
  });
}
