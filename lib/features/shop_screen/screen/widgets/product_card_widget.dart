import 'package:flutter/material.dart';
import 'package:magnit_shop/features/shop_screen/domain/entity/product/product.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;
  final bool isFilterUsed;
  final Function(Product) onProductTap;

  const ProductCardWidget({
    required this.product,
    required this.isFilterUsed,
    required this.onProductTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      type: MaterialType.card,
      color: Colors.amber[100],
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onTap: isFilterUsed ? () => onProductTap(product) : null,
        radius: 20,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                  type: MaterialType.card,
                  color: Colors.red[400]?.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(product.productName),
                  )),
              Flexible(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: product.parameterList.length,
                  itemBuilder: (_, paramIndex) {
                    final parameter = product.parameterList[paramIndex];
                    return parameter == null
                        ? const SizedBox.shrink()
                        : Text(product.parameterList[paramIndex]?.name ?? '');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
