import 'package:flutter/material.dart';
import 'package:tarea_login/widgets/custom_textformfield.dart';
import 'package:tarea_login/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                      allowEmpty: false
                    ),
                    validator: (value){
                      (value == 'andres.leiva@unah.hn') ? null : 'Correo inválido';
          
                      return null;
                    },
                  ),
                  
                  //Contraseña
                  CustomTextFormField(
                    inputInfo: CustomTextFormClass(
                      labelText: 'Ingrese su contraseña',
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Icons.lock,
                      suffixIcon: Icons.visibility,
                      obscureText: true,
                      allowEmpty: false
                    ),
                    validator: (value){
                      (value == '20212030272')? null : 'Contraseña incorrecta';
          
                      return null;
                    },
                  ),
                  
                  //Botón iniciar sesión
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
                      }
                      
                    },
                    child: Text('Iniciar Sesión', style: TextStyle(fontSize: 20)),
                  ),
          
                  //Botón Registrarse
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: TextButton(
                      onPressed: (){}, 
                      child: Text('Registrarse', style: TextStyle(fontSize: 20, color: Colors.black),),),
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

