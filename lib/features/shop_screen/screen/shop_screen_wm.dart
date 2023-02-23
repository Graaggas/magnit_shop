import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:magnit_shop/features/app/di/app_scope.dart';
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

  return ShopScreenWM(model: model);
}

/// Widget model for [ShopScreen].
class ShopScreenWM extends WidgetModel<ShopScreen, ShopScreenModel> implements IShopScreenWM {
  final _shopEntityState = EntityStateNotifier<List<Shop>>();
  late final StreamSubscription<BaseShopState> _stateStatusSubscription;
  @override
  ListenableState<EntityState<List<Shop>>> get shopEntityState => _shopEntityState;

  ShopScreenWM({required ShopScreenModel model}) : super(model);

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

    super.dispose();
  }

  void _updateState(BaseShopState state) {
    if (state is InitShopState) {
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
}
