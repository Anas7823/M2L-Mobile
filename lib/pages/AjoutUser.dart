import 'package:flutter/material.dart';
import '../User.dart';

class AjoutUser extends StatefulWidget {
  const AjoutUser({super.key});

  @override
  State<AjoutUser> createState() => _AjoutUserState();
}

class _AjoutUserState extends State<AjoutUser> {
  final GlobalKey<FormState> login = GlobalKey<FormState>();
  final themeController = TextEditingController();
  final UserController = TextEditingController();
  final reponseController = TextEditingController();

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
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: themeController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Thème',
                      hintText: 'Entrez un thème'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez rentrer un thème";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  controller: UserController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User',
                      hintText: 'Entrez une User'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez rentrer une User";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  controller: reponseController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Réponse',
                      hintText: 'Entrez la réponse'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez rentrer la réponse";
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
                        User.ajoutUser(context, themeController.text,
                            UserController.text, reponseController.text);
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
