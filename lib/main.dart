import 'package:flutter/material.dart';
import 'pages/AffichageProd.dart';
import 'pages/AjoutProd.dart';
import 'pages/AffichageUser.dart';
import 'pages/AjoutUser.dart';
import 'pages/Connexion.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({super.key});

  static const String _title = 'Quizz';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notre application de quizz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const Connexion(),
        '/listeProduit': (context) => const AffichageProd(),
        '/ajoutProduit': (context) => const AjoutProd(),
        '/listeUser': (context) => const AffichageUser(),
        '/ajoutUser': (context) => const AjoutUser(),
      },
    );
  }
}
