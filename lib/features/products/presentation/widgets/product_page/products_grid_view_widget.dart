import 'package:ecommerce/features/products/domain/entity/product.dart';
import 'package:flutter/material.dart';

class ProductsWidget extends StatelessWidget {
  final List<Product> products;
  final int productItemCount;
  final Widget? Function(BuildContext, int) productItemBuilder;
  const ProductsWidget(
      {required this.products,
      super.key,
      required this.productItemCount,
      required this.productItemBuilder});

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Expanded(
        child: GridView.builder(
      physics: const ScrollPhysics(),
      itemCount: productItemCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.0,
      ), // spacing between columns
      itemBuilder: productItemBuilder,
    ));
  }
}
