import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_valley/core/products_cuibt/products_cubit.dart';
import 'package:fruits_valley/core/widgets/search_text_filed.dart';
import 'package:fruits_valley/features/home/presentaion/view/widgets/banners_list.dart';
import 'package:fruits_valley/features/home/presentaion/view/widgets/best_selling_header.dart';
import 'package:fruits_valley/features/home/presentaion/view/widgets/custom_home_app_bar.dart';
import 'package:fruits_valley/features/home/presentaion/view/widgets/fruit_item_grid_view.dart';
import 'package:fruits_valley/features/home/presentaion/view/widgets/fruits_item_grid_view_bloc_builder.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
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
      child: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomHomeAppBar(),
                SearchTextField(),
                SizedBox(
                  height: 16,
                ),
                BannersListView(),
                SizedBox(
                  height: 12,
                ),
                BestSellingHeader(),
              ],
            ),
          ),
          BestSellingGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
