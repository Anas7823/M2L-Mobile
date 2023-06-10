import 'package:flutter/material.dart';
import 'pages/AffichageProd.dart';
import 'pages/AjoutProd.dart';
import 'pages/AffichageUser.dart';
import 'pages/AjoutUser.dart';
import 'pages/Connexion.dart';

void main() => runApp(const Home());

final List _pages = [
  "Produit","User"
];

int _selectedTab = 0;

class Home extends StatefulWidget {
  const Home({super.key});

  static const String _title = 'Admin Gestion Sport et User';

    @override State<Home> createState() =>_HomeState();
}

class _HomeState extends State<Home> {

  static const String _title = 'Admin Gestion Sport et User';

  @override
  Widget build(BuildContext context) {
    return
    MaterialApp(  
      title: 'Notre application d\'administration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        // '/': (context) => const Connexion(),
        '/': (context) => const AffichageProd(),
        '/ajoutProduit': (context) => const AjoutProd(),
        '/listeUser': (context) => const AffichageUser(),
        '/ajoutUser': (context) => const AjoutUser(),
      },
    );
  }
}
