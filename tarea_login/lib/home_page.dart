import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  
  const HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    final datos = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
        title: const Text('Inicio'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //Logo
              SizedBox(
                height: 200,
                child: Image.asset('assets/images/unah.png'),
              ),
              //Boton de cerrar sesion
              Card(
                child: ListView(
                  children: [
                    ListTile(
                      title: Text('Bienvenido ${datos['nombre']}',style: TextStyle(fontSize: 25, color: Colors.blueAccent),),
                    ),
                    ListTile(
                      title: const Text('Correo:',style: TextStyle(fontSize: 25, color: Colors.blueAccent),),
                      subtitle: Text(datos['correo']),
                    ),
                    ListTile(
                      title: const Text('Telefono:',style: TextStyle(fontSize: 25, color: Colors.blueAccent),),
                      subtitle: Text(datos['telefono']),
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}