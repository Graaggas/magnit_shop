import 'package:equatable/equatable.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/shop/shop.dart';

/// Base state for shop.
abstract class BaseShopState extends Equatable {
  @override
  List<Object> get props => [];
}

/// Base state containing shop.
abstract class ShopContentState extends BaseShopState {
  /// Current list of shops.
  final List<Shop> shopList;

  @override
  List<Object> get props => [shopList];

  /// Create an instance [ShopContentState].
  ShopContentState({required this.shopList});
}

/// Init state.
class InitShopState extends BaseShopState {}

/// Loading shop state.
class LoadingShopState extends BaseShopState {}

/// Loading error state.
class LoadingErrorState extends BaseShopState {}

/// Shop state.
class ShopState extends ShopContentState {
  ShopState(List<Shop> shopList) : super(shopList: shopList);
}
