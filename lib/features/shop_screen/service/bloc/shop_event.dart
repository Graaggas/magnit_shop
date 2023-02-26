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

  /// Parameter filter.
  final String? parameterFilter;

  @override
  List<Object?> get props => [
        productFilter,
        parameterFilter,
      ];

  /// Constructor of [ShopUpdateEvent].
  const ShopUpdateEvent({
    required this.productFilter,
    required this.parameterFilter,
  });
}

/// Shop load event.
class ShopLoadEvent extends ShopUpdateEvent {
  const ShopLoadEvent({String? productFilter, String? parameterFilter})
      : super(
          productFilter: productFilter,
          parameterFilter: parameterFilter,
        );
}
