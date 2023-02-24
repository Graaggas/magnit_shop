import 'package:hive_flutter/hive_flutter.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/parameter/parameter.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/product/product.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/shop/shop.dart';
import 'package:magnit_shop/features/shop_screen/service/repository/shop_repository_keys.dart';

/// Shop repository.
class ShopRepository implements IShopRepository {
  @override
  Future<void> initData() async {
    final isParametersBoxExist = await Hive.boxExists(ShopRepositoryKeys.parametersKey);
    if (!isParametersBoxExist) {
      final parametersBox = await Hive.openBox<Parameter>(ShopRepositoryKeys.parametersKey);
      await parametersBox.add(Parameter(id: 0, name: 'weight'));
      await parametersBox.add(Parameter(id: 1, name: 'height'));
      await parametersBox.add(Parameter(id: 2, name: 'width'));
      await parametersBox.add(Parameter(id: 3, name: 'length'));
    }

    final isProductsBoxExist = await Hive.boxExists(ShopRepositoryKeys.productsKey);
    if (!isProductsBoxExist) {
      final productsBox = await Hive.openBox<Product>(ShopRepositoryKeys.productsKey);
      final parametersBox = await Hive.openBox(ShopRepositoryKeys.productsKey);

      await productsBox.add(Product(id: 0, productName: 'Cattle', parameterList: [
        parametersBox.get(0),
        parametersBox.get(1),
      ]));
      await productsBox.add(Product(id: 1, productName: 'Mug', parameterList: [
        parametersBox.get(3),
        parametersBox.get(2),
      ]));
      await productsBox.add(Product(id: 2, productName: 'Plate', parameterList: [
        parametersBox.get(0),
        parametersBox.get(3),
      ]));
    }

    final isShopsBoxExist = await Hive.boxExists(ShopRepositoryKeys.shopsKey);
    if (!isShopsBoxExist) {
      final shopsBox = await Hive.openBox<Shop>(ShopRepositoryKeys.shopsKey);
      final productsBox = await Hive.openBox<Product>(ShopRepositoryKeys.productsKey);

      await shopsBox.addAll([
        Shop(id: 0, shopName: 'WORLD OF CUPS', productList: [
          productsBox.get(1),
        ]),
        Shop(id: 1, shopName: 'HANDY STUFF', productList: [
          productsBox.get(1),
          productsBox.get(0),
        ]),
        Shop(id: 2, shopName: 'NOTHING TO GIVE, SO SORRY', productList: [
          productsBox.get(0),
          productsBox.get(2),
        ]),
      ]);
    }
    // final shopsBox = await Hive.openBox<Shop>('shops');
    // return shopsBox.values;
  }

  @override
  Future<Iterable<Shop>> fetchShops() async {
    final shopsBox = await Hive.openBox<Shop>(ShopRepositoryKeys.shopsKey);

    return shopsBox.values;
  }
}

/// Interface for [ShopRepository].
abstract class IShopRepository {
  /// Init data.
  Future<void> initData();

  /// Fetch shops.
  Future<Iterable<Shop>> fetchShops();
}
