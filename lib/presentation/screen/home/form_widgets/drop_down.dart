import 'package:olivehomes/core/util/colors.dart';
import 'package:olivehomes/core/util/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FormDropDown extends StatelessWidget {
  final List? dropdownItems;
  final String? label;
  final String? initialValue;

  const FormDropDown(
      {Key? key, this.dropdownItems, this.label, this.initialValue})
      : super(key: key);

  get areaUnit => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 8, 8.0),
      child: FormBuilderDropdown(
          // validator: FormBuilderValidators.required(),
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: ColorUtils.themeBlack,
                    width: 1.0,
                  )),
              // contentPadding: EdgeInsets.all(10),
              labelText: label,
              labelStyle: const TextStyle(
                fontSize: 18.0,
                // fontWeight: FontWeight.bold,
              )),
          validator: FormBuilderValidators.required(
            errorText: "Please select a value",
          ),
          initialValue: initialValue ?? dropdownItems![0],
          name: label!.capitalize().replaceAll(' ', ''),
          items: List.generate(
              dropdownItems!.length,
              (index) => DropdownMenuItem(
                    value: dropdownItems![index],
                    child: Text(
                      dropdownItems![index],
                      style: TextStyle(color: ColorUtils.themeBlack),
                    ),
                  ))),
    );
  }
}
