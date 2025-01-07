import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helper_function/get_dummy_products.dart';
import '../../../../../core/products_cuibt/products_cubit.dart';
import 'products_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return ProductsGirdView(
            products: state.products,
          );
        } else if (state is ProductsFailer) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        } else {
          return SliverSkeletonizer(
              enabled: true,
              child: ProductsGirdView(
                products: getDummyProducts(),
              ));
        }
      },
    );
  }
}
