
import 'package:flutter/material.dart';

class CustomTextFormClass {
  String labelText;
  TextInputType? keyboardType;
  IconData? prefixIcon;
  IconData? suffixIcon;

  bool allowEmpty;
  bool obscureText;
  

  CustomTextFormClass({
    this.labelText ='',
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.allowEmpty = true,
    this.obscureText = false,
  });
}

class UserClass {
  String nombre;
  String telefono;
  String correo;
  String contrasenia;

  UserClass({
    this.nombre = '',
    this.telefono = '',
    this.correo = '',
    this.contrasenia = '',
  });
}


class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required  this.inputInfo,
    this.validator,
    required this.controller
    });

    final CustomTextFormClass inputInfo;
    final String? Function(String?)? validator;
    final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.start,
        keyboardType: inputInfo.keyboardType,
        obscureText: inputInfo.obscureText,

        decoration: InputDecoration(
          label: Text(inputInfo.labelText),
          prefixIcon: Icon(inputInfo.prefixIcon),
          suffixIcon: Icon(inputInfo.suffixIcon),
          border: const OutlineInputBorder(),
        ),

        validator: validator,
      ),
    );
  }
}