import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_valley/features/home/presentaion/view/home_view.dart';
import '../../../../../core/helper_function/build_error_message.dart';
import '../../../../../core/services/custom_prgress_hud.dart';
import '../../signin_cubit/signin_cubit.dart';
import 'login_view_body.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninScuccess) {
          buildErrorMessage(context, 'تم تسجيل الدخول بنجاح');
          Navigator.pushNamed(context, HomeView.routeName);
        }
        if (state is SigninFailure) {
          buildErrorMessage(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is SigninLoading ? true : false,
            child: const SignInViewBody());
      },
    );
  }
}
