import 'package:olivehomes/core/util/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FormTextField extends StatefulWidget {
  final String? label;
  final TextInputType? keyboardType;
  final int? maxLines;
  String? initialValue;
  bool? isLimited;
  final GlobalKey<FormBuilderState>? formkey;
  // final Key? formkey;
  FormTextField(
      {Key? key,
      this.label,
      this.keyboardType,
      this.maxLines = 1,
      this.initialValue,
      this.formkey,
      this.isLimited = false})
      : super(key: key);

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  // final ValueChanged onChanged =(value) => debugPrint('text field value: $value');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 8, 8.0),
      child: FormBuilderTextField(
        maxLength: widget.isLimited! ? 45 : null,
        initialValue: widget.initialValue,
        validator: FormBuilderValidators.required(),
        maxLines: widget.maxLines,
        name: widget.label!.capitalize().replaceAll(' ', ''),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                )),
            labelText: widget.label!,
            labelStyle: const TextStyle(
              fontSize: 18.0,
              // fontWeight: FontWeight.bold,
            )),

        onChanged: (text) {
          setState(() {
            widget.initialValue = text;
            print(" On chnages call vayo haii");
            print(widget.initialValue.toString());
            print(text.toString());
          });

          // formkey?.currentState.save();
        },
        valueTransformer: (value) {
          value = widget.initialValue;
        },
        // valueTransformer: (text) => num.tryParse(text!),
        keyboardType: widget.keyboardType,
      ),
    );
  }
}
