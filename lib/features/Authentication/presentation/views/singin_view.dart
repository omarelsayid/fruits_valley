import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/git_it_service.dart';
import '../../domain/auth_repo.dart';
import '../signin_cubit/signin_cubit.dart';
import 'widgets/build_app_bar.dart';
import 'widgets/sign_up_view_body_bloc_consumer.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar:
            buildAppBar(context, title: 'تسجيل الدخول', showBackIcon: false),
        body: const SignInViewBodyBlocConsumer(),
      ),
    );
  }
}
