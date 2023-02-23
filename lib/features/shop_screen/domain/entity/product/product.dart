import 'package:hive/hive.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/parameter/parameter.dart';
part 'product.g.dart';

/// Product.
@HiveType(typeId: 2)
class Product {
  /// Product id.
  @HiveField(0)
  final int id;

  /// Product name.
  @HiveField(1)
  final String productName;

  /// List of parameters.
  @HiveField(2)
  final List<Parameter?> parameterList;

  Product({
    required this.id,
    required this.productName,
    required this.parameterList,
  });
}
