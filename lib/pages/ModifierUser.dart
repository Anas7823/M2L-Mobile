import 'dart:convert';
import 'dart:ffi';
import 'dart:developer' as developer;
import 'dart:io';
import 'package:flutter/material.dart';
import '../User.dart';

class Modifier extends StatefulWidget {
  final int id;

  const Modifier({Key? key, required this.id}) : super(key: key);

  @override
  State<Modifier> createState() => _ModifierState();
}

class _ModifierState extends State<Modifier> {
  final GlobalKey<FormState> login = GlobalKey<FormState>();
  final NomCompteController = TextEditingController();
  final MdpCompteController = TextEditingController();
  final CompteAdminController = TextEditingController();
  final MailCompteController = TextEditingController();
  final AdresseCompteController = TextEditingController();
  late Future<List> _User;

  @override
  void initState() {
    super.initState();
    // On récupère les informations de la User avec son id
    // passé en paramètre
    _User = User.getUser(widget.id);
    _User.then((value) => {
          // On pré-remplit le formulaire avec les données récupérer de l'API
          NomCompteController.text = value[0]['NomCompte'],
          developer.log('Value1 Marche', name: 'my.app.category'),
          MdpCompteController.text = value[0]['MdpCompte'],
          developer.log('Value2 Marche', name: 'my.app.category'),
          CompteAdminController.text = value[0]['CompteAdmin'] ==0 ? "0" : "1",
          developer.log('Value3 Marche', name: 'my.app.category'),
          MailCompteController.text = value[0]['MailCompte'],
          developer.log('Value4 Marche', name: 'my.app.category'),
          AdresseCompteController.text = value[0]['AdresseCompte'],
          developer.log('Value5 Marche', name: 'my.app.category')
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
        title: const Text("Modification d'une User"),
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
                    "Modifier un User",
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
                  controller: NomCompteController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Compte',
                      hintText: 'Entrez un nom de compte'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez rentrer un nom de compte";
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
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
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  controller: CompteAdminController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Compte Admin',
                      hintText: 'Entrez si le compte est admin (1 Pour Admin, 0 pour User)'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez si le compte est admin";
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
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
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
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
                        User.Update(
                            context,
                            widget.id,
                            NomCompteController.text,
                            MdpCompteController.text,
                            (CompteAdminController.text) == "0" ? false : true,
                            MailCompteController.text,
                            AdresseCompteController.text);
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
