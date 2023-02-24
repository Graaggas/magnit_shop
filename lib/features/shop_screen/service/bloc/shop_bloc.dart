import 'package:bloc/bloc.dart';
import 'package:magnit_shop/features/shop_screen/service/bloc/shop_event.dart';
import 'package:magnit_shop/features/shop_screen/service/bloc/shop_state.dart';
import 'package:magnit_shop/features/shop_screen/service/repository/shop_repository.dart';

/// Bloc for shops.
class ShopBloc extends Bloc<BaseShopEvent, BaseShopState> {
  final IShopRepository _shopRepository;

  ShopBloc(this._shopRepository) : super(InitShopState()) {
    on<ShopLoadEvent>(_loadShop);
  }

  Future<void> _loadShop(
    ShopLoadEvent event,
    Emitter<BaseShopState> emit,
  ) async {
    emit(LoadingShopState());
    try {
      final shopList = await _shopRepository.fetchShops();
      emit(ShopState(shopList.toList()));
    } on Exception catch (_) {
      emit(LoadingErrorState());
    }
  }
}
