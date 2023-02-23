import 'package:equatable/equatable.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/product/product.dart';

/// Basic shop event.
abstract class BaseShopEvent extends Equatable {
  @override
  List<Object?> get props => [];

  /// Constructor.
  const BaseShopEvent();
}

/// Base class for updating shops.
abstract class ShopUpdateEvent extends BaseShopEvent {
  /// Shop id.
  final int id;

  /// Shop name;
  final String name;

  /// List of products.
  final List<Product> productList;

  @override
  List<Object?> get props => [
        id,
        name,
        productList,
      ];

  /// Constructor of [ShopUpdateEvent].
  const ShopUpdateEvent({
    required this.id,
    required this.name,
    required this.productList,
  });
}

/// Shop load event.
class ShopLoadEvent extends BaseShopEvent {}
