import 'package:ecommerce/core/functions/navigation.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_page/product_widget.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_page/products_grid_view_widget.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_page/text_form_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/font_style_manager.dart';
import '../../domain/entity/product.dart';

class HomePage extends StatefulWidget {
  final List<Product> products;
  const HomePage({super.key, required this.products});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Product> searchedProducts;

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: _buildBody(),
    ));
  }

  _searchForProduct(String searchedItem) {
    searchedProducts = widget.products
        .where(
            (product) => product.title.toLowerCase().startsWith(searchedItem))
        .toList();
    setState(() {});
  }

  _buildBody() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/images/menu_icon.png'),
              iconSize: 30,
            ),
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                customReplacmentNavigation(context, '/get');
              },
              icon: Image.asset('assets/images/cart_icon.png'),
              iconSize: 30,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Hello',
              style: FontManager.interSemiBold28,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Welcome username',
              style: FontManager.interRegular13,
            ),
          ),
        ),
        FormFieldWidget(
          controller: _controller,
          onChangedFunction: (searchedItem) {
            _searchForProduct(searchedItem);
          },
        ),
        ProductsWidget(
          products: widget.products,
          productItemCount: _controller.text.isEmpty
              ? widget.products.length
              : searchedProducts.length,
          productItemBuilder: (context, index) => ProductWidget(
            product: _controller.text.isEmpty
                ? widget.products[index]
                : searchedProducts[index],
          ),
        )
      ],
    );
  }
}
