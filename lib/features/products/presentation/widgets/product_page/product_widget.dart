import 'package:ecommerce/features/products/presentation/pages/product_details_page.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/product.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailPage(
                product: product,
              ),
            ));
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsetsDirectional.fromSTEB(
          8,
          8,
          8,
          8,
        ),
        padding: const EdgeInsetsDirectional.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: GridTile(
          footer: Container(
            color: Colors.black54,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    product.title,
                    maxLines: 2,
                    softWrap: true,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ' \$${product.price}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          child: Container(
            color: Colors.grey,
            width: double.infinity,
            child: Hero(
              tag: product.id!,
              child: Image.network(
                product.image,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
