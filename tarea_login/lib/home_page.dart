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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: SizedBox(
                  height: 250,
                  child: Image.asset('assets/images/unah.png'),
                ),
              ),
              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      title: Text('Bienvenido ${datos['nombre']}',style: const TextStyle(fontSize: 25, color: Colors.blueAccent),),
                    ),
                    ListTile(
                      title: const Text('Correo:',style: TextStyle(fontSize: 25, color: Colors.black87),),
                      subtitle: Text(datos['correo']),
                    ),
                    ListTile(
                      title: const Text('Telefono:',style: TextStyle(fontSize: 25, color: Colors.black87),),
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