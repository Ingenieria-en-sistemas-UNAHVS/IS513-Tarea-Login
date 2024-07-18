import 'package:flutter/material.dart';
import 'package:tarea_login/widgets/custom_textformfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController _correoController = TextEditingController();
final TextEditingController _contraseniaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
        title: const Text('Inicio de Sesión'),
        ),
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Logo
                  SizedBox(
                    height: 200,
                    child: Image.asset('assets/images/unah.png'),
                  ),
                  //Correo, debe ser el institucional
                  CustomTextFormField(
                    inputInfo: CustomTextFormClass(
                      labelText: 'Ingrese su correo',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icons.email,
                      //allowEmpty: false
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Correo requerido';
                      }
                      if(value != 'andres.leiva@unah.hn'){
                        return 'Correo incorrecto';                      }

                      return null;
                    },
                    controller: _correoController,
                  ),
                  
                  //Contraseña
                  CustomTextFormField(
                    inputInfo: CustomTextFormClass(
                      labelText: 'Ingrese su contraseña',
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Icons.lock,
                      //suffixIcon: Icons.visibility,
                      obscureText: true,
                      //allowEmpty: false
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Contraseña requerida';
                      }
                      if(value != '20212030272'){
                        return 'Contraseña incorrecta';                      
                        }
                      return null;
                    },
                    controller: _contraseniaController,
                  ),
                  
                  //Botón iniciar sesión
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final datos = {
                          'nombre': 'Andres Leiva',
                          'telefono': '99999999',
                          'correo': _correoController.text,
                          'contrasenia': _contraseniaController.text,
                        };
                        Navigator.of(context).pushReplacementNamed('/home', arguments: datos);
                      }
                      
                    },
                    child: const Text('Iniciar Sesión', style: TextStyle(fontSize: 20)),
                  ),
          
                  //Botón Registrarse
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: TextButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed('/register');
                      }, 
                      child: const Text('Registrarse', style: TextStyle(fontSize: 20, color: Colors.black),),),
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

