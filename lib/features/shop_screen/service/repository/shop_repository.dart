import 'package:hive_flutter/hive_flutter.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/parameter/parameter.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/product/product.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/shop/shop.dart';
import 'package:magnit_shop/features/shop_screen/service/repository/i_shop_repository.dart';
import 'package:magnit_shop/features/shop_screen/service/repository/shop_repository_keys.dart';

/// Shop repository.
class ShopRepository implements IShopRepository {
  @override
  Future<void> initData() async {
    final isShopBoxExist = await Hive.boxExists(ShopRepositoryKeys.shopsKey);
    if (!isShopBoxExist) {
      // Fill Parameters
      final parametersBox = await Hive.openBox(ShopRepositoryKeys.parametersKey);

      await parametersBox.add(Parameter(id: 0, name: 'weight'));
      await parametersBox.add(Parameter(id: 1, name: 'height'));
      await parametersBox.add(Parameter(id: 2, name: 'anything'));
      await parametersBox.add(Parameter(id: 3, name: 'length'));
      await parametersBox.add(Parameter(id: 4, name: 'nothing'));
      await parametersBox.add(Parameter(id: 5, name: 'latitude'));

      // Fill Products
      final productsBox = await Hive.openBox<Product>(ShopRepositoryKeys.productsKey);

      await productsBox.add(Product(id: 0, productName: 'Cattle', parameterList: [
        parametersBox.get(0),
        parametersBox.get(1),
      ]));

      await productsBox.add(Product(id: 1, productName: 'Mug', parameterList: [
        parametersBox.get(3),
        parametersBox.get(2),
      ]));

      await productsBox.add(Product(id: 2, productName: 'Plate', parameterList: [
        parametersBox.get(4),
        parametersBox.get(5),
      ]));

      await productsBox.add(Product(id: 3, productName: 'Spoon', parameterList: [
        parametersBox.get(4),
        parametersBox.get(0),
      ]));

      // Fill Shops
      final shopsBox = await Hive.openBox<Shop>(ShopRepositoryKeys.shopsKey);

      await shopsBox.addAll([
        Shop(id: 0, shopName: 'WORLD OF CUPS', productList: [
          productsBox.get(1),
        ]),
        Shop(id: 1, shopName: 'HANDY STUFF', productList: [
          productsBox.get(1),
          productsBox.get(0),
          productsBox.get(3),
        ]),
        Shop(id: 2, shopName: 'NOTHING TO GIVE, SO SORRY', productList: [
          productsBox.get(0),
          productsBox.get(2),
        ]),
        Shop(id: 3, shopName: 'NEED THINGS', productList: [
          productsBox.get(1),
          productsBox.get(5),
          productsBox.get(3),
        ]),
      ]);

      shopsBox.close();
      productsBox.close();
      parametersBox.close();
    }
  }

  @override
  Future<List<Shop>> fetchShops(String? productFilter) async {
    final shopsBox = await Hive.openBox<Shop>(ShopRepositoryKeys.shopsKey);

    if (productFilter == null || productFilter.isEmpty) {
      return shopsBox.values.toList();
    }

    final shopListFiltered = shopsBox.values.where((shop) {
      if (shop.productList.isEmpty) return false;

      final productsList = shop.productList;

      for (var product in productsList) {
        final productName = product?.productName.toLowerCase().trim();

        if (productName == null) continue;

        if (productName.contains(productFilter.toLowerCase().trim())) {
          return true;
        }

        continue;
      }

      return false;
    }).toList();

    return shopListFiltered;
  }
}
