import 'package:flutter/material.dart';
import './questoes.dart';
import './respostas.dart';

void main() => runApp(appUnifeob());

class appUnifeobState extends State<appUnifeob> {
  var perguntaSelecionada = 0;

  void ReiniciarQustionario() {
    setState(() {
      perguntaSelecionada = 0;
    });
  }

  var perguntas = [
    {
      'texto': 'Você já estudou na modalidade EAD? ',
      'resposta': ['Sim', 'Não']
    },
    {
      'texto': 'Como conheceu a UNIFEOB?',
      'resposta': ['Google', 'Instagram', 'Fecebook', 'Amigos']
    },
    {
      'texto': 'Como você pontua a plaforma de estudos?',
      'resposta': ['Muito Boa', 'Boa', 'Ruim']
    },
  ];

  void resposta() {
    setState(() {
      perguntaSelecionada++;
    });
  }

  bool get temPerguntas {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntas
        ? perguntas[perguntaSelecionada]['resposta'] as List<String>
        : [];

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 0, 49, 84),
              foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              titleTextStyle: const TextStyle(fontSize: 20),
              title: const Text('Unifeob - EAD'),
            ),
            body: temPerguntas
                ? Column(
                    children: [
                      Questoes(
                          perguntas[perguntaSelecionada]['texto'] as String),
                      ...respostas.map((t) => Respostas(t, resposta)).toList(),
                    ],
                  )
                : Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Obrigado por Sua Participação!',
                          style: TextStyle(fontSize: 24),
                        ),
                        ElevatedButton(
                          onPressed: ReiniciarQustionario,
                          child: const Text('Reiniciar'),
                        )
                      ],
                    ),
                  )));
  }
}

class appUnifeob extends StatefulWidget {
  const appUnifeob({super.key});
  @override
  appUnifeobState createState() {
    return appUnifeobState();
  }
}
