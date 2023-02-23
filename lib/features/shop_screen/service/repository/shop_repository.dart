import 'package:hive_flutter/hive_flutter.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/parameter/parameter.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/product/product.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/shop/shop.dart';

/// Shop repository.
class ShopRepository implements IShopRepository {
  @override
  Future<Iterable<Shop>> initData() async {
    final isParametersBoxExist = await Hive.boxExists('parameters');
    if (!isParametersBoxExist) {
      final parametersBox = await Hive.openBox<Parameter>('parameter');
      await parametersBox.add(Parameter(id: 0, name: 'weight'));
      await parametersBox.add(Parameter(id: 1, name: 'height'));
      await parametersBox.add(Parameter(id: 2, name: 'width'));
      await parametersBox.add(Parameter(id: 3, name: 'length'));
    }

    final isProductsBoxExist = await Hive.boxExists('products');
    if (!isProductsBoxExist) {
      final productsBox = await Hive.openBox<Product>('products');
      final parametersBox = await Hive.openBox('parameters');

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

    final isShopsBoxExist = await Hive.boxExists('shops');
    if (!isShopsBoxExist) {
      final shopsBox = await Hive.openBox<Shop>('shops');
      final productsBox = await Hive.openBox<Product>('products');

      await shopsBox.addAll([
        Shop(id: 0, shopName: 'Cup World', productList: [
          productsBox.get(1),
        ]),
        Shop(id: 1, shopName: 'Handy Items', productList: [
          productsBox.get(1),
          productsBox.get(0),
        ]),
        Shop(id: 2, shopName: 'Nothing to give', productList: [
          productsBox.get(0),
          productsBox.get(2),
        ]),
      ]);
    }
    final shopsBox = await Hive.openBox<Shop>('shops');
    return shopsBox.values;
  }
}

/// Interface for [ShopRepository].
abstract class IShopRepository {
  /// Init data.
  Future<Iterable<Shop>> initData();
}
