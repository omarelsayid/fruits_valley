import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/git_it_service.dart';
import '../../domain/auth_repo.dart';
import '../signup_cubit/signup_cubit.dart';
import 'widgets/build_app_bar.dart';
import 'widgets/signup_view_body_bloc_consumer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = 'signUp';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'تسجيل جديد'),
        body: const SignupViewBodyBlocConsumer(),
      ),
    );
  }
}
