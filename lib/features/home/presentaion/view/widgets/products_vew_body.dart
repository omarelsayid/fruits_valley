import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/products_cuibt/products_cubit.dart';
import '../../../../../core/widgets/search_text_filed.dart';
import '../../../../Authentication/presentation/views/widgets/build_app_bar.dart';

import 'products_grid_view_bloc_builder.dart';
import 'products_view_header.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductsCubit>().getBestSellingProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                buildAppBar(
                  context,
                  title: 'المنتجات',
                  showBackIcon: false,
                ),
                const SearchTextField(),
                const SizedBox(
                  height: 16,
                ),
                ProductsViewHeader(
                  productsLlength:
                      context.watch<ProductsCubit>().productsLenght,
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          const ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
