import 'package:bloc_de_notas/models/notas.dart';
import 'package:bloc_de_notas/screens/notas_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Notas> listaNotas = [];
  void agregarNota(Notas nota) {
    setState(() {
      listaNotas.add(nota);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App de Bloc de notas"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: listaNotas.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => NotasScreen(
                        notaExistente: listaNotas[index],
                        onGuardar: (notaEditada) {
                          setState(() {
                            listaNotas[index] = notaEditada;
                          });
                        },
                        onEliminar: (notaABorrar) {
                          setState(() {
                            listaNotas.remove(notaABorrar);
                          });
                        },
                      ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Card(
                child: ListTile(
                  title: Text(
                    listaNotas[index].titulo,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    listaNotas[index].contenido,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => NotasScreen(
                    onGuardar: (notaNueva) {
                      agregarNota(notaNueva);
                    },
                  ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
