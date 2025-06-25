import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = ['assets/1.jpg', 'assets/2.jpg', 'assets/3.jpg'];
  List<int> imagemSelecionada = [0, 1, 2];
  int TremQueContaWin = 0;

  void sortear() {
    int i = 0;
    while (i < 5) {
      setState(() {
        imagemSelecionada[0] = Random().nextInt(images.length);
        imagemSelecionada[1] = Random().nextInt(images.length);
        imagemSelecionada[2] = Random().nextInt(images.length);
      });
      i++;
    }

    if (imagemSelecionada[0] == imagemSelecionada[1] &&
        imagemSelecionada[1] == imagemSelecionada[2]) {

      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text("Parabéns"),
              content: const Text("Você ganhou."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("OK"),
                ),
              ],
            ),
      );
        setState(() {
        TremQueContaWin++;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    final larguraTela = MediaQuery.of(context).size.width;
    final larguraImagem = larguraTela / 3;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "EROS",
          style: TextStyle(color: Color.fromARGB(255, 125, 0, 197)),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 187, 0),
      ),
      backgroundColor: const Color.fromARGB(255, 239, 245, 248),
      floatingActionButton: FloatingActionButton.large(
        onPressed: sortear,
        backgroundColor: const Color.fromARGB(255, 255, 187, 0),
        foregroundColor: const Color.fromARGB(255, 125, 0, 197),
        child: const Icon(Icons.catching_pokemon),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                images[imagemSelecionada[0]],
                width: larguraImagem,
                height: 500,
              ),
              Image.asset(
                images[imagemSelecionada[1]],
                width: larguraImagem,
                height: 500,
              ),
              Image.asset(
                images[imagemSelecionada[2]],
                width: larguraImagem,
                height: 500,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Vitórias: $TremQueContaWin',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 125, 0, 197),
            ),
          ),
        ],
      ),
    );
  }
}
