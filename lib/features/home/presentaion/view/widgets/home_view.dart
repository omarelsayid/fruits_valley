import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_valley/core/products_cuibt/products_cubit.dart';
import 'package:fruits_valley/core/repos/product_repo/product_repo.dart';
import 'package:fruits_valley/core/services/git_it_service.dart';
import 'package:fruits_valley/core/widgets/search_text_filed.dart';
import 'package:fruits_valley/features/home/presentaion/view/widgets/banners_list.dart';
import 'package:fruits_valley/features/home/presentaion/view/widgets/best_selling_header.dart';
import 'package:fruits_valley/features/home/presentaion/view/widgets/custom_bottom_naigation_bar.dart';
import 'package:fruits_valley/features/home/presentaion/view/widgets/custom_home_app_bar.dart';
import 'package:fruits_valley/features/home/presentaion/view/widgets/fruit_item_grid_view.dart';
import 'package:fruits_valley/features/home/presentaion/view/widgets/home_vie_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
          child: const HomeViewBody()),
    );
  }
}
