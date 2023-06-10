import 'dart:ffi';

import 'package:flutter/material.dart';
import '../Produit.dart';

class AjoutProd extends StatefulWidget {
  const AjoutProd({super.key});

  @override
  State<AjoutProd> createState() => _AjoutProdState();
}

class _AjoutProdState extends State<AjoutProd> {
  final GlobalKey<FormState> login = GlobalKey<FormState>();
  final NomProduitController = TextEditingController();
  final PrixProduitController = TextEditingController();
  final StockProduitController = TextEditingController();
  final IdSportController = TextEditingController();
  final ImageProduitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: login,
        child: _AjoutProd(context),
      ),
      key: UniqueKey(),
    );
  }

  Widget _AjoutProd(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajout d'un produit"),
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
                    "Ajouter un Produit",
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
                      labelText: 'Nom produit',
                      hintText: 'Entrez un produit'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez rentrer un produit";
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
                      labelText: 'Sport',
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
                      hintText: 'Entrez le lien d\'une image'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez rentrer le lien d'une image";
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
                        Produit.ajoutProd(context, NomProduitController.text,
                            double.parse(PrixProduitController.text), int.parse(StockProduitController.text),
                            int.parse(IdSportController.text), ImageProduitController.text);
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
