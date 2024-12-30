import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_valley/core/helper_function/get_dummy_products.dart';
import 'package:fruits_valley/core/products_cuibt/products_cubit.dart';
import 'package:fruits_valley/features/home/presentaion/view/widgets/fruit_item_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellingGridViewBlocBuilder extends StatelessWidget {
  const BestSellingGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return BestSellingGirdView(
            products: state.products,
          );
        } else if (state is ProductsFailer) {
          return SliverToBoxAdapter(child: ErrorWidget(state.message));
        } else {
          return SliverSkeletonizer(
              enabled: true,
              child: BestSellingGirdView(
                products: getDummyProducts(),
              ));
        }
      },
    );
  }
}
