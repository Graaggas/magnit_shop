import 'package:elementary/elementary.dart';
import 'package:magnit_shop/features/shop_screen/service/bloc/shop_bloc.dart';
import 'package:magnit_shop/features/shop_screen/service/bloc/shop_event.dart';
import 'package:magnit_shop/features/shop_screen/service/bloc/shop_state.dart';
import 'package:magnit_shop/features/shop_screen/service/repository/shop_repository.dart';

/// Model for [ShopScreen].
class ShopScreenModel extends ElementaryModel {
  late final IShopRepository _shopRepository;

  final ShopBloc _shopBloc;

  /// Stream to track the state of the _shopBloc.
  Stream<BaseShopState> get shopStateStream => _shopBloc.stream;

  /// Gives the current state.
  BaseShopState get currentState => _shopBloc.state;

  /// Constructor for [ShopScreenModel].
  ShopScreenModel({required IShopRepository shopRepository, required ShopBloc shopBloc})
      : _shopRepository = shopRepository,
        _shopBloc = shopBloc,
        super();

  @override
  Future<void> init() async {
    super.init();

    _shopBloc.add(ShopLoadEvent());
  }
}
