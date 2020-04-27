import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(primaryColor: Colors.green.shade900),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff003300),
            title: Text('Dados Puzzle',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
            centerTitle: true,
          ),
          backgroundColor: Colors.green.shade900,
          body: Dados(),
        ),
      ),
    );

class Dados extends StatefulWidget {
  @override
  _DadosState createState() => _DadosState();
}

class _DadosState extends State<Dados> {
  bool estaJogando = false;
  int dadoEsquerdo = 1;
  int dadoDireito = 6;

  void jogarDados() {
    setState(() {
      estaJogando = true;
    });
    Future.delayed(Duration(seconds: 1)).then((_) {
      setState(() {
        dadoEsquerdo = Random().nextInt(6) + 1;
        dadoDireito = Random().nextInt(6) + 1;
        estaJogando = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return SafeArea(
      child: InkWell(
        onTap: estaJogando ? null : jogarDados,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            estaJogando
                ? Expanded(
                    child: Image.asset('images/dados.gif'),
                  )
                : Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Image.asset('images/dado$dadoEsquerdo.png')),
                      ),
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Image.asset('images/dado$dadoDireito.png')),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
