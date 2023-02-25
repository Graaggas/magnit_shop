import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:magnit_shop/features/app/di/app_scope.dart';
import 'package:magnit_shop/features/navigation/service/app_coordinate.dart';
import 'package:magnit_shop/features/navigation/service/coordinator.dart';
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

  final TextEditingController _productFilteringController = TextEditingController();

  @override
  ListenableState<EntityState<List<Shop>>> get shopEntityState => _shopEntityState;

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

    super.dispose();
  }

  @override
  void onFilterTap() {
    model.filterByProduct(_productFilteringController.text);
  }

  @override
  void onShopCardTap(Shop shop) => _coordinator.navigate(
        context,
        AppCoordinates.aboutShopScreen,
        arguments: shop,
      );

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

  /// On shop card tap.
  void onShopCardTap(Shop shop);

  /// On filter icon button tap.
  void onFilterTap();
}
