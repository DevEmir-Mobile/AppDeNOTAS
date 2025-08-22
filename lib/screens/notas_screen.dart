import 'package:bloc_de_notas/models/notas.dart';
import 'package:flutter/material.dart';

class NotasScreen extends StatefulWidget {
    final Notas? notaExistente;
  final Function(Notas) onGuardar;
  final Function(Notas)? onEliminar;
  const NotasScreen({super.key, this.notaExistente, required this.onGuardar, this.onEliminar, });

  @override
  State<NotasScreen> createState() => _NotasScreenState();
}
    @override
class _NotasScreenState extends State<NotasScreen> {
  late final TextEditingController _tituloController;
  late final TextEditingController _contenidoController;

  @override
  void initState() {
    super.initState();

    _tituloController = TextEditingController(
      text: widget.notaExistente?.titulo ?? '',
    );

    _contenidoController = TextEditingController(
      text: widget.notaExistente?.contenido ?? '',
    );
  }

  @override
  void dispose() {
    _tituloController.dispose();
    _contenidoController.dispose();
    super.dispose();
  }

  void _guardarNota() {
    final notaNueva = Notas(
      titulo: _tituloController.text,
      contenido: _contenidoController.text,
    );

    widget.onGuardar(notaNueva);
    Navigator.pop(context);
  }

  void _eliminarNota() {
    if (widget.onEliminar != null && widget.notaExistente != null) {
      widget.onEliminar!(widget.notaExistente!);
    }
    Navigator.pop(context);
  }
  

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
           icon: Icon(Icons.arrow_back)),
           actions: [
            IconButton(onPressed: _guardarNota,
             icon: Icon(Icons.check)),
           
          IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: _eliminarNota,
       
    ),
      ],
      ),
      body: Column(
        children: [
           Padding(
             padding: const EdgeInsets.only(left: 10),
             child: TextField(
              controller: _tituloController,
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
              controller: _contenidoController,
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
