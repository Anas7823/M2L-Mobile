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
  final themeController = TextEditingController();
  final userController = TextEditingController();
  final reponseController = TextEditingController();
  late Future<List> _User;

  @override
  void initState() {
    super.initState();
    // On récupère les informations de la User avec son id
    // passé en paramètre
    _User = User.getUser(widget.id);
    _User.then((value) => {
          // On pré-remplit le formulaire avec les données récupérer de l'API
          themeController.text = value[0]['theme'],
          userController.text = value[0]['User'],
          reponseController.text = value[0]['reponse'],
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
                    "Modifier une User",
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
                  controller: userController,
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
                        User.Update(
                            context,
                            widget.id,
                            themeController.text,
                            userController.text,
                            reponseController.text);
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
