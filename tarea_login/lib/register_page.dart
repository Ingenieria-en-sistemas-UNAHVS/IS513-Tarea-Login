import 'package:flutter/material.dart';

import 'widgets/custom_textformfield.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
final formKey = GlobalKey<FormState>();
final correoController = TextEditingController();
final contraseniaController = TextEditingController();
final confirmarContraseniaController = TextEditingController();
final nombreController = TextEditingController();
final telefonoController = TextEditingController();
  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
        title: const Text('Registro de Usuario'),
        ),
      body: ListView(
        children: [
          Form(
            key: formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Logo
                  SizedBox(
                    height: 150,
                    child: Image.asset('assets/images/unah.png'),
                  ),

                  //Nombre
                  CustomTextFormField(
                    inputInfo: CustomTextFormClass(
                      labelText: 'Nombre',
                      keyboardType: TextInputType.name,
                      prefixIcon: Icons.person,
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Nombre requerido';
                      }
                      if(value.length < 3){
                        return 'Nombre muy corto';
                      }
                      if(value.length > 10){
                        return 'Nombre muy largo';
                      }

                      return null;
                    },
                    controller: nombreController,
                  ),

                  //Telefono
                  CustomTextFormField(
                    inputInfo: CustomTextFormClass(
                      labelText: 'Teléfono',
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icons.phone,
                      allowEmpty: false
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Teléfono requerido';
                      }
                      if(value.length < 8 || value.length > 8){
                        return 'Teléfono inválido';
                      }
                      if(!value.startsWith('3') && !value.startsWith('9')){
                        return 'Número de teléfono inválido';
                      }

                      return null;
                    },
                    controller: telefonoController,
                  ),


                  //Correo, debe ser el institucional
                  CustomTextFormField(
                    inputInfo: CustomTextFormClass(
                      labelText: 'Correo',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icons.email,
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Correo requerido';
                      }
                      if(value.length < 11){
                        return 'Dirección inválida';
                      }
                      if(value.contains(RegExp(r' ')) || value.contains(RegExp(r'[!#<>?":`~;[\]\\|=+)(*&^%]'))){
                        return 'Correo inválido';
                      }
                      if(!value.contains('@')){
                        return 'Correo incorrecto';
                      }

                      final List<String> parts = value.split('@');
                      if(parts.length != 2){
                        return 'Correo inválido';
                      }

                      if(!value.contains('@unah.hn') || !value.endsWith('@unah.hn')){
                        return 'Dominio de correo incorrecto';                      
                      }

                      return null;
                    },
                    controller: correoController,
                  ),
                  
                  //Contraseña
                  CustomTextFormField(
                    inputInfo: CustomTextFormClass(
                      labelText: 'Contraseña',
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Icons.lock,
                      //suffixIcon: Icons.visibility,
                      obscureText: true,
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Contraseña requerida';
                      }
                      if(value.length < 8){
                        return 'Contraseña muy corta';
                      }
                      if(!value.contains(RegExp(r'[0-9]'))){
                        return 'La contraseña debe contener al menos un número';
                      }
                      if(!value.contains(RegExp(r'[A-Z]'))){
                        return 'La contraseña debe contener al menos una mayúscula';
                      }
                      if(!value.contains(RegExp(r'.[!@#<>?":_`~;[\]\\|=+)(*&^%-]'))){
                        return 'Debe contener un caracter especial';
                      }
                      
                      return null;
                    },
                    controller: contraseniaController,
                  ),

                  //Confirmar contraseña
                  CustomTextFormField(
                    inputInfo: CustomTextFormClass(
                      labelText: 'Confirmar contraseña',
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Icons.lock,
                      //suffixIcon: Icons.visibility,
                      obscureText: true,
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Contraseña requerida';
                      }
                      if(value != contraseniaController.text){
                        return 'Las contraseñas no coinciden';
                      }
                      return null;
                    },
                    controller: confirmarContraseniaController,
                  ),
                  
                  //Botón iniciar sesión
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final datos = UserClass(
                          nombre: nombreController.text,
                          telefono: telefonoController.text,
                          correo: correoController.text,
                          contrasenia: contraseniaController.text,
                        );
                        const SnackBar(content: Text('Usuario registrado exitosamente'));
                        
                        print('Nombre: ${datos.nombre}');
                        print('Teléfono: ${datos.telefono}');
                        print('Correo: ${datos.correo}');
                        print('Contraseña: ${datos.contrasenia}');

                        
                      }
                      
                    },
                    child: const Text('Registrarse', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}