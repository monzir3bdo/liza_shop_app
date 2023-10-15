import 'package:ecommerce/core/font_style_manager.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(),
      ),
    );
  }

  _buildAppBar(context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_rounded),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_cart,
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            width: 350,
            height: 400,
            color: Colors.white,
            child: Hero(
              tag: product.id!,
              child: Image.network(
                product.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            product.title,
            style: FontManager.interMedium28.copyWith(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Price",
            style: FontManager.interSemiBold28.copyWith(
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '\$${product.price}',
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Size',
            style: FontManager.interSemiBold28.copyWith(
              fontSize: 17,
            ),
          ),
          const Row(),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Description',
            style: FontManager.interSemiBold28.copyWith(
              fontSize: 17,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(product.description),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Category',
            style: FontManager.interSemiBold28.copyWith(
              fontSize: 17,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            product.category,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            onPressed: () {},
            buttonText: 'Add To Cart',
            height: 75,
            width: 375,
          ),
        ],
      ),
    );
  }
}
