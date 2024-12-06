import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/helper_function/build_error_message.dart';
import '../../../../../core/services/custom_password_text_field.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_filed.dart';
import '../../signup_cubit/signup_cubit.dart';
import 'do_you_an_account.dart';
import 'terms_and_condition.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool agreeWithTermsAndConditions = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password, name;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormFiled(
                  onSaved: (value) {
                    name = value!;
                  },
                  hintText: 'الاسم كامل',
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormFiled(
                  onSaved: (value) {
                    email = value!;
                  },
                  hintText: 'البريد الإلكتروني',
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 16,
              ),
              PasswordTextField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TermsAndCondition(
                onAcceptChanged: (value) {
                  agreeWithTermsAndConditions = value;
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                  onpressed: () {
                    if (agreeWithTermsAndConditions) {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context
                            .read<SignupCubit>()
                            .createUserWithEmailAndPassword(
                                email, password, name)
                            .whenComplete(() {
                          formKey.currentState!.reset();
                        });
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    } else {
                      buildErrorMessage(
                          context, 'يجب عليك الموافقة علي الشروط و الاحكام');
                    }
                  },
                  text: 'إنشاء حساب جديد'),
              const SizedBox(
                height: 26,
              ),
              const DoYouHaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
