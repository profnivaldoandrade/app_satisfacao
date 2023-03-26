import 'package:flutter/material.dart';

class Respostas extends StatelessWidget {
  final String texto;
  final void Function() quandoResponder;

  const Respostas(this.texto, this.quandoResponder, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: quandoResponder,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 253, 197, 7),
            foregroundColor: const Color.fromARGB(255, 0, 49, 84),
            padding: const EdgeInsets.all(15)
            ),
        child: Text(
          texto,
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
