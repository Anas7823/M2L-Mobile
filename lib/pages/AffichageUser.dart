import 'dart:async';
import 'ModifierUser.dart';
import '../User.dart';
import 'package:flutter/material.dart';

class AffichageUser extends StatefulWidget {
  const AffichageUser({Key? key}) : super(key: key);

  @override
  State<AffichageUser> createState() => _AffichageUserState();
}

class _AffichageUserState extends State<AffichageUser> {
  late Future<List> _User;

  @override
  void initState() {
    super.initState();
    _User = User.getAllUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des utilisateurs"),
      ),
      body: FutureBuilder<List>(
        future: _User,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            snapshot.data![i]['User'].toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            snapshot.data![i]['reponse'].toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0, top: 0, bottom: 0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Modifier(
                                                id: int.parse(snapshot.data![i]
                                                        ["id"]
                                                    .toString()))),
                                      );
                                    },
                                    child: const Icon(Icons.edit)),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    showModalBottomSheet<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SizedBox(
                                          height: 200,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                const Text(
                                                    'Êtes-vous sûr de vouloir supprimer cette User ? '),
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 15.0,
                                                                right: 15.0,
                                                                top: 15.0,
                                                                bottom: 0),
                                                        child: ElevatedButton(
                                                            child: const Text(
                                                                'Oui'),
                                                            onPressed: () {
                                                              User.Delete(
                                                                  context,
                                                                  int.parse(snapshot
                                                                      .data![i]
                                                                          ["id"]
                                                                      .toString()));
                                                            }),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 15.0,
                                                                right: 15.0,
                                                                top: 15.0,
                                                                bottom: 0),
                                                        child: ElevatedButton(
                                                          child:
                                                              const Text('Non'),
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  context),
                                                        ),
                                                      )
                                                    ]),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: const Icon(Icons.delete)),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return const Center(
              child: Text("Pas de données"),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/ajout');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
