import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/services/custom_password_text_field.dart';
import '../../signin_cubit/signin_cubit.dart';
import '../../../../../core/utils/app_images.dart';
import 'social_login_button.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_filed.dart';
import 'dont_have_an_account.dart';
import 'or_divider.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  late String email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormFiled(
                onSaved: (value) {
                  email = value!;
                },
                textInputType: TextInputType.emailAddress,
                hintText: 'البريد الإلكتروني',
              ),
              const SizedBox(
                height: 16,
              ),
              PasswordTextField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyles.semiBold13
                        .copyWith(color: const Color(0xff2D9F5D)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 33),
                child: CustomButton(
                    onpressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context
                            .read<SigninCubit>()
                            .signInWithEmailAndPassword(email, password)
                            .whenComplete(() {
                          formKey.currentState!.reset();
                        });
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                      }
                    },
                    text: 'تسجيل الدخول'),
              ),
              const DontHaveAnAccountWidget(),
              const OrDivider(),
              SocialLoginButton(
                image: Assets.imagesGoogleIcon,
                onPressed: () async {
                  await context.read<SigninCubit>().signInWithGoogle();
                },
                tilte: 'تسجيل بواسطة جوجل',
              ),
              const SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                image: Assets.imagesAppleIcon,
                onPressed: () {},
                tilte: '  تسجيل بواسطة أبل',
              ),
              const SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                image: Assets.imagesFaceBook,
                onPressed: () {
                  // context.read<SigninCubit>().signInWithFacebook();
                },
                tilte: ' تسجيل بواسطة فيسبوك ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
