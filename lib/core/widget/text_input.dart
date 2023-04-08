import 'package:olivehomes/config/constants.dart';
import 'package:olivehomes/config/theme.dart';
import 'package:olivehomes/core/util/extension.dart';
import 'package:olivehomes/core/util/input_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:olivehomes/presentation/screen/provider/olive_provider.dart';
import 'package:provider/provider.dart';

class InputTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final FormFieldSetter<String> onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final String? initialValue;
  final TextInputType? keyboardType;
  final bool? isPassword;

  InputTextField({
    Key? key,
    required this.onSaved,
    required this.labelText,
    required this.hintText,
    this.validator,
    this.inputFormatters,
    this.controller,
    this.initialValue,
    this.keyboardType,
    this.isPassword,
  }) : super(key: key);

  final _border = OutlineInputBorder(
    borderRadius: Corners.smBorder,
    borderSide: BorderSide(
      color: AppColors.kGrey,
      width: 1.4,
    ),
  );

  @override
  Widget build(BuildContext context) {
    OliveProvider oliveProvider = Provider.of<OliveProvider>(context);
    return TextFormField(
      
      obscureText: isPassword == true? oliveProvider.isVisible : false,
      controller: controller,
      inputFormatters: inputFormatters,
      onSaved: onSaved,
      validator: validator ?? InputUtils.validateField,
      initialValue: initialValue,
      keyboardType: keyboardType,
      style: context.textTheme.bodyMedium!
          .copyWith(color: Colors.white, fontSize: FontSizes.s16),
      decoration: InputDecoration(
        suffixIcon: isPassword==true? IconButton(
          icon: Icon(
            oliveProvider.isVisible ? Icons.visibility : Icons.visibility_off,
            color: AppColors.kGrey,
          ),
          onPressed: () {
            oliveProvider.toggleVisibility();
            
          },
        ):null,
        labelText: labelText,
        hintText: hintText,
        errorStyle:
            context.textTheme.caption!.copyWith(color: AppColors.kError),
        labelStyle: context.textTheme.caption!.copyWith(color: AppColors.kGrey),
        hintStyle:
            context.textTheme.bodyMedium!.copyWith(color: AppColors.kGrey),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        isDense: true,
        border: _border,
        enabledBorder: _border,
        focusedBorder: _border.copyWith(
          borderSide: BorderSide(
            color: AppColors.kPrimary,
            width: 0.9,
          ),
        ),
        errorBorder: _border,
        focusedErrorBorder: _border,
      ),
    );
  }
}
