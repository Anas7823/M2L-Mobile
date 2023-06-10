import 'dart:ffi';

import 'package:flutter/material.dart';
import '../Produit.dart';

class Modifier extends StatefulWidget {
  final int id;

  const Modifier({Key? key, required this.id}) : super(key: key);

  @override
  State<Modifier> createState() => _ModifierState();
}

class _ModifierState extends State<Modifier> {
  final GlobalKey<FormState> login = GlobalKey<FormState>();
  final NomProduitController = TextEditingController();
  final PrixProduitController = TextEditingController();
  final StockProduitController = TextEditingController();
  final IdSportController = TextEditingController();
  final ImageProduitController = TextEditingController();
  late Future<List> _produit;

  @override
  void initState() {
    super.initState();
    // On récupère les informations de la produit avec son id
    // passé en paramètre
    _produit = Produit.getproduit(widget.id);
    _produit.then((value) => {
          // On pré-remplit le formulaire avec les données récupérer de l'API
          NomProduitController.text = value[0]['NomProduit'],
          PrixProduitController.text = value[0]['PrixProduit'].toString(),
          StockProduitController.text = value[0]['StockProduit'].toString(),
          IdSportController.text = value[0]['IdSport'].toString(),
          ImageProduitController.text = value[0]['ImageProduit'],
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: login,
        child: _Modifier(context),
      ),
      key: UniqueKey(),
    );
  }

  Widget _Modifier(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modification d'une produit"),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(50),
                child: Center(
                  child: Text(
                    "Modifier une produit",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.blueAccent),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  controller: NomProduitController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nom de produit',
                      hintText: 'Entrez une produit'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez rentrer une produit";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  controller: PrixProduitController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Prix',
                      hintText: 'Entrez le prix'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez rentrer le prix";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  controller: StockProduitController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Stock',
                      hintText: 'Entrez le stock'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez rentrer le stock";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  controller: IdSportController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Id Sport',
                      hintText: 'Entrez l\'id du sport'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez rentrer l'id du sport";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  controller: ImageProduitController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Image',
                      hintText: 'Entrez le lien de l\'image'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez rentrer le lien de l'image";
                    }
                    return null;
                  },
                ),
              ),

              Center(
                child: Container(
                  height: 50,
                  width: 250,
                  margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      if (login.currentState!.validate()) {
                        Produit.Update(
                            context,
                            widget.id,
                            NomProduitController.text,
                            double.parse(PrixProduitController.text),
                            int.parse(StockProduitController.text),
                            int.parse(IdSportController.text)
                            );
                      }
                    },
                    child: const Text("Validez",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white)),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
