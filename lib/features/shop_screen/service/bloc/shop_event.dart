import 'package:equatable/equatable.dart';

/// Basic shop event.
abstract class BaseShopEvent extends Equatable {
  @override
  List<Object?> get props => [];

  /// Constructor.
  const BaseShopEvent();
}

/// Base class for updating list of shops.
abstract class ShopUpdateEvent extends BaseShopEvent {
  /// Product filter.
  final String? productFilter;

  @override
  List<Object?> get props => [
        productFilter,
      ];

  /// Constructor of [ShopUpdateEvent].
  const ShopUpdateEvent({
    required this.productFilter,
  });
}

/// Shop load event.
class ShopLoadEvent extends ShopUpdateEvent {
  const ShopLoadEvent({String? productFilter}) : super(productFilter: productFilter);
}
