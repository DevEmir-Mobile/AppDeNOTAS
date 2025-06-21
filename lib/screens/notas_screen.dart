import 'package:flutter/material.dart';

class Notas extends StatefulWidget {
  const Notas({super.key});

  @override
  State<Notas> createState() => _NotasState();
}
    @override
class _NotasState extends State<Notas> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController tituloNota = TextEditingController();


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fondo oscuro
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        leading: 
          IconButton(onPressed: () {
            Navigator.pop(context);
          },
           icon: Icon(Icons.arrow_back))
       
      ),
      body: Column(
        children: [
           Padding(
             padding: const EdgeInsets.only(left: 10),
             child: TextField(
              controller: tituloNota,
              keyboardType: TextInputType.multiline,
              maxLines: 1,
              style: TextStyle(color: Colors.white, fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Título de la nota',
                hintStyle: TextStyle( fontSize: 40, fontWeight: FontWeight.w900),
                border: InputBorder.none,
              ),
              cursorColor: Colors.white,
                       ),
           ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(color: Colors.white, fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Escribe tu nota aquí...',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
              cursorColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
