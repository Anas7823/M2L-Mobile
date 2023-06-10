import 'dart:ffi';

import 'package:flutter/material.dart';
import '../User.dart';

class AjoutUser extends StatefulWidget {
  const AjoutUser({super.key});

  @override
  State<AjoutUser> createState() => _AjoutUserState();
}

class _AjoutUserState extends State<AjoutUser> {
  final GlobalKey<FormState> login = GlobalKey<FormState>();
  final NomCompteController = TextEditingController();
  final MdpCompteController = TextEditingController();
  final CompteAdminController = TextEditingController();
  final MailCompteController = TextEditingController();
  final AdresseCompteController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: login,
        child: _AjoutUser(context),
      ),
      key: UniqueKey(),
    );
  }

  Widget _AjoutUser(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajout d'un compte"),
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
                    "Ajouter un Compte",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.blueAccent),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: NomCompteController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nom de compte',
                      hintText: 'Entrez un nom de compte'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez rentrer un thème";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: MdpCompteController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mot de passe',
                      hintText: 'Entrez un mot de passe'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez rentrer un mot de passe";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: CompteAdminController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Compte admin',
                      hintText: 'Entrez un compte admin'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez rentrer un compte admin";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: MailCompteController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mail',
                      hintText: 'Entrez un mail'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez rentrer un mail";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: AdresseCompteController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Adresse',
                      hintText: 'Entrez une adresse'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez rentrer une adresse";
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
                        User.ajoutUser(context, NomCompteController.text,
                            MdpCompteController.text, CompteAdminController.text as bool, MailCompteController.text, AdresseCompteController.text);
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
