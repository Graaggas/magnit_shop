import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/shop/shop.dart';
import 'package:magnit_shop/features/shop_screen/screen/shop_screen_wm.dart';

/// Screen for shops.
class ShopScreen extends ElementaryWidget<ShopScreenWM> {
  const ShopScreen({
    Key? key,
    WidgetModelFactory wmFactory = createShopScreenWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ShopScreenWM wm) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 104,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            SizedBox(height: 8),
            FilterTextField(
              hintText: 'Фильтрация по товару',
            ),
            SizedBox(height: 8),
            FilterTextField(
              hintText: 'Фильтрация по характеристике',
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
      body: EntityStateNotifierBuilder<List<Shop>>(
        listenableEntityState: wm.shopEntityState,
        loadingBuilder: (_, __) => const CircularProgressIndicator(),
        errorBuilder: (_, __, ___) => const Center(
          child: Text('Error loading'),
        ),
        builder: (_, shops) {
          if (shops == null) {
            return const Center(
              child: Text('data is null'),
            );
          }

          return Column(
            children: [
              const SizedBox(height: 16),
              Expanded(
                child: ShopCard(shops: shops),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ShopCard extends StatelessWidget {
  final List<Shop> shops;
  const ShopCard({
    required this.shops,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: shops.length,
      itemBuilder: (_, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.grey[300],
          elevation: 1,
          child: SizedBox(
            height: 64,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(shops[index].shopName),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: shops[index].productList.length,
                      itemBuilder: (_, indexProduct) => Text(
                        shops[index].productList[indexProduct]?.productName ?? '',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FilterTextField extends StatelessWidget {
  final String hintText;
  const FilterTextField({
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(37.0),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black26,
          ),
          contentPadding: const EdgeInsets.all(10.0),
          filled: true,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black45,
          ),
          hintText: hintText,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
