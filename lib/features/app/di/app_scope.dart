import 'package:magnit_shop/features/navigation/service/coordinator.dart';
import 'package:magnit_shop/features/shop_screen/service/bloc/shop_bloc.dart';
import 'package:magnit_shop/features/shop_screen/service/repository/i_shop_repository.dart';
import 'package:magnit_shop/features/shop_screen/service/repository/shop_repository.dart';

/// Scope of dependencies which need through all app's life.
class AppScope implements IAppScope {
  late final Coordinator _coordinator;
  late final IShopRepository _shopRepository;
  late final ShopBloc _shopBloc;

  @override
  Coordinator get coordinator => _coordinator;

  @override
  IShopRepository get shopRepository => _shopRepository;

  @override
  ShopBloc get shopBloc => _shopBloc;

  /// Constructor for [AppScope].
  AppScope() {
    _coordinator = Coordinator();
    _shopRepository = ShopRepository();
    _shopBloc = ShopBloc(_shopRepository);
  }
}

/// App dependencies.
abstract class IAppScope {
  /// Class that coordinates navigation for the whole app.
  Coordinator get coordinator;

  /// Shop repository.
  IShopRepository get shopRepository;

  /// Get bloc.
  ShopBloc get shopBloc;
}
