import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:magnit_shop/features/app/app.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/parameter/parameter.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/product/product.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/shop/shop.dart';

/// App launch.
Future<void> run() async {
  await Hive.initFlutter();
  _registerAppAdapters();
  runApp(const App());
}

void _registerAppAdapters() {
  Hive.registerAdapter(ShopAdapter());
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(ParameterAdapter());
}
