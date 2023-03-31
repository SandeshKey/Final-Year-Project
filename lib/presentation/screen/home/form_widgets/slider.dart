import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FormSlider extends StatelessWidget {
  final String? name;
  final String? sliderLabel;
  final double? max;
  final int? divisions;
  final double? initialValue;
  final double? mainInitialvalue;
  const FormSlider(
      {Key? key,
      this.name,
      this.sliderLabel,
      this.max,
      this.divisions,
      this.initialValue,
      this.mainInitialvalue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 8, 8.0),
      // padding: const EdgeInsets.all(8.0),
      child: FormBuilderSlider(
        validator: FormBuilderValidators.required(),
        name: name!,
        // validator: FormBuilderValidators.compose([
        //   FormBuilderValidators.min(context, 6),
        // ]),
        onChanged: (value) {
          // debugPrint(
          //     'slider value: ${_formkey.currentState?.value['slider']}');
        },

        min: 0.0,
        max: max!,
        initialValue:
            mainInitialvalue == null ? initialValue! : mainInitialvalue!,
        divisions: divisions!,
        activeColor: Colors.indigo,
        inactiveColor: Colors.pink[100],
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),

            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                )),
            labelText: sliderLabel!,
            labelStyle: const TextStyle(
              fontSize: 18.0,
              // fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
