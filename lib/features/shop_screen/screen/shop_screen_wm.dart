import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:magnit_shop/features/app/di/app_scope.dart';
import 'package:magnit_shop/features/navigation/service/app_coordinate.dart';
import 'package:magnit_shop/features/navigation/service/coordinator.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/product/product.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/shop/shop.dart';
import 'package:magnit_shop/features/shop_screen/screen/shop_screen.dart';
import 'package:magnit_shop/features/shop_screen/screen/shop_screen_model.dart';
import 'package:magnit_shop/features/shop_screen/service/bloc/shop_state.dart';
import 'package:provider/provider.dart';

/// Factory for [ShopScreenWM].
ShopScreenWM createShopScreenWM(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final model = ShopScreenModel(
    shopRepository: appDependencies.shopRepository,
    shopBloc: appDependencies.shopBloc,
  );

  return ShopScreenWM(
    model: model,
    coordinator: appDependencies.coordinator,
  );
}

/// Widget model for [ShopScreen].
class ShopScreenWM extends WidgetModel<ShopScreen, ShopScreenModel> implements IShopScreenWM {
  final Coordinator _coordinator;
  final _shopEntityState = EntityStateNotifier<List<Shop>>();
  late final StreamSubscription<BaseShopState> _stateStatusSubscription;

  final _isFilterUsed = ValueNotifier(false);

  final _productFilteringController = TextEditingController();

  final _productFilterFocusNode = FocusNode();

  @override
  FocusNode get productFilterFocusNode => _productFilterFocusNode;

  @override
  ListenableState<EntityState<List<Shop>>> get shopEntityState => _shopEntityState;

  @override
  ValueListenable<bool> get isFilterUsedState => _isFilterUsed;

  @override
  TextEditingController get productFilteringController => _productFilteringController;

  ShopScreenWM({
    required ShopScreenModel model,
    required Coordinator coordinator,
  })  : _coordinator = coordinator,
        super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _stateStatusSubscription = model.shopStateStream.listen(_updateState);
    _updateState(model.currentState);
  }

  @override
  void dispose() {
    _shopEntityState.dispose();
    _stateStatusSubscription.cancel();
    _productFilteringController.dispose();
    _productFilterFocusNode.dispose();

    super.dispose();
  }

  @override
  void onFilterTap() {
    final filterText = _productFilteringController.text;

    if (_productFilteringController.text.isEmpty) {
      _isFilterUsed.value = false;
      model.filterByProduct();
      _productFilterFocusNode.unfocus();

      return;
    }

    model.filterByProduct(productFilter: filterText);
    _isFilterUsed.value = true;

    _productFilterFocusNode.unfocus();
  }

  @override
  void onShopCardTap(Shop shop) {
    _coordinator.navigate(
      context,
      AppCoordinates.shopDetailsScreen,
      arguments: shop,
    );
  }

  @override
  void onProductTap(Product product) {
    _coordinator.navigate(
      context,
      AppCoordinates.productDetailsScreen,
      arguments: product,
    );
  }

  void _updateState(BaseShopState state) {
    if (state is InitShopState) {
      _shopEntityState.loading();
    } else if (state is LoadingShopState) {
      _shopEntityState.loading();
    } else if (state is ShopState) {
      final shops = state.shopList;
      _shopEntityState.content(shops);
    } else if (state is LoadingErrorState) {
      _shopEntityState.error();
    }
  }
}

/// Interface for [ShopScreenWM].
abstract class IShopScreenWM {
  /// State.
  ListenableState<EntityState<List<Shop>>> get shopEntityState;

  /// Filter by product controller.
  TextEditingController get productFilteringController;

  /// Filter by product focus node.
  FocusNode get productFilterFocusNode;

  /// Filter using state.
  ValueListenable<bool> get isFilterUsedState;

  /// On shop card tap.
  void onShopCardTap(Shop shop);

  /// On product tab.
  void onProductTap(Product product);

  /// On filter icon button tap.
  void onFilterTap();
}
