import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/custom_text_form_filed.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    this.onSaved,
  });
  final void Function(String?)? onSaved;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormFiled(
        obsecureText: obscureText,
        suffixIcon: IconButton(
          onPressed: () {
            obscureText = !obscureText;
            setState(() {});
          },
          icon: obscureText
              ? const Icon(
                  Icons.visibility_off,
                  color: Color(0xff949D9E),
                )
              : const Icon(
                  Icons.visibility,
                  color: Color(0xff949D9E),
                ),
        ),
        onSaved: widget.onSaved,
        hintText: 'كلمة المرور',
        textInputType: TextInputType.visiblePassword);
  }
}
