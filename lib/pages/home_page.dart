import 'package:flutter/material.dart';
import 'package:grupo/providers/avatar_provider.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cambio = Provider.of<CambioProvider>(context);

    return Scaffold(
      backgroundColor: (cambio.dato?Colors.purple:Colors.blue),
      appBar: AppBar(
        backgroundColor:  (cambio.dato?Colors.purple:Colors.blue),
        centerTitle: true,
        title: (cambio.dato == false)
            ? Row(children: [
              Icon(Icons.male),
              Text("Masculino")
            ],)
            :Row(children: [
              Icon(Icons.female),
              Text("Femenino")
            ],),
        actions: [
          Switch(
            value: cambio.dato,
            onChanged: (value) {
              cambio.cambiar(value);
            },
          ),
          IconButton(
            onPressed: () {
              cambio.btncambiar();
            },
            icon: const Icon(Icons.arrow_circle_right),
          ),
        ],
      ),
      body: Stack(
        
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              
              child: ListView(children: [
                CircleAvatar(
                  backgroundColor:Colors.white,
                  radius: 80,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: (cambio.dato?NetworkImage("https://img.freepik.com/foto-gratis/retrato-hermoso-mujer-joven-posicion-pared-gris_231208-10760.jpg?w=2000"):NetworkImage("https://img.freepik.com/foto-gratis/guapo-exitoso-hombre-negocios-sonriente_176420-19024.jpg?w=2000")),
                  ),
                )
              ]),
            ),
          ),
          Visibility(
            visible: cambio.dato1,
            child: Center(

              child: (cambio.dato?Text("Avatar femenino seleccionado",style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold,),textAlign:TextAlign.center,):Text("Avatar masculino seleccionado",style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),textAlign:TextAlign.center)),
                
              ),
            ),
          
        ],
      ),
    );
  }
}
