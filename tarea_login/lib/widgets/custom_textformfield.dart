import 'package:flutter/material.dart';

class CustomTextFormClass {
  String? labelText;
  TextInputType? keyboardType;
  IconData? prefixIcon;
  IconData? suffixIcon;

  bool doValidate;
  bool obscureText;

  CustomTextFormClass({
    this.labelText,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.doValidate = false,
    this.obscureText = false,
  });
}


class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required  this.inputInfo
    });

    final CustomTextFormClass inputInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        textAlign: TextAlign.start,
        keyboardType: inputInfo.keyboardType,
        decoration: InputDecoration(
          labelText: inputInfo.labelText,
          prefixIcon: Icon(inputInfo.prefixIcon),
          suffixIcon: Icon(inputInfo.suffixIcon),

          border: const OutlineInputBorder(),
        ),
        validator: (value){
          if(value == null || value.isEmpty){
            return 'Este campo es obligatorio';
          }
          return null;
        },
      ),
    );
  }
}