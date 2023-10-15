import 'package:ecommerce/core/widgets/error_widget.dart';
import 'package:ecommerce/features/products/presentation/bloc/products/bloc/products_bloc.dart';
import 'package:ecommerce/features/products/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/loading_widget.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      backgroundColor: const Color(0xffFEFEFE),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child:
          BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
        if (state is ProductsLoadingState) {
          return const LoadingWidget();
        } else if (state is ProductsLoadedState) {
          return HomePage(
            products: state.products,
          );
        } else if (state is ProductsErrorState) {
          return ErrorMessageWidget(
            message: state.message,
          );
        }
        return const LoadingWidget();
      }),
    );
  }
}
