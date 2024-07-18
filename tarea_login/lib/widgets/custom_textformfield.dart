import 'package:flutter/material.dart';

class CustomTextFormClass {
  String? labelText;
  TextInputType? keyboardType;
  IconData? prefixIcon;
  IconData? suffixIcon;

  bool allowEmpty;
  bool obscureText;

  CustomTextFormClass({
    this.labelText,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.allowEmpty = true,
    this.obscureText = false,
  });
}


class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required  this.inputInfo,
    this.validator,
    });

    final CustomTextFormClass inputInfo;
    final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: TextFormField(
        textAlign: TextAlign.start,
        keyboardType: inputInfo.keyboardType,
        obscureText: inputInfo.obscureText,

        decoration: InputDecoration(
          labelText: inputInfo.labelText,
          prefixIcon: Icon(inputInfo.prefixIcon),
          suffixIcon: Icon(inputInfo.suffixIcon),
          border: const OutlineInputBorder(),
        ),

        validator: (value){
          if(inputInfo.allowEmpty){
            return null;
          }

          if(value == null || value.isEmpty){
            return 'Este campo es obligatorio';
          }

          validator!(value);
          return null;
        },
      ),
    );
  }
}