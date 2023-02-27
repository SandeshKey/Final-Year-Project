import 'package:dufuna/core/util/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FormRadioButton extends StatelessWidget {
  final String? radioLabel;
  final bool? initialRadioValue;
  const FormRadioButton({Key? key, this.radioLabel, this.initialRadioValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 8, 8.0),
      child: FormBuilderRadioGroup(
        validator: FormBuilderValidators.required(),

        initialValue: initialRadioValue == null ? null : initialRadioValue,

        // validator: FormBuilderValidators.required(),
        decoration: InputDecoration(
            // contentPadding: EdgeInsets.all(10),
            labelText: radioLabel!,
            labelStyle: const TextStyle(
              fontSize: 18.0,
              // fontWeight: FontWeight.bold,
            )),

        onChanged: (data) {},
        name: radioLabel!.capitalize().replaceAll(' ', ''),
        options: const [
          FormBuilderFieldOption(value: true, child: Text("Yes")),
          FormBuilderFieldOption(value: false, child: Text("No")),
        ],
      ),
    );
  }
}
