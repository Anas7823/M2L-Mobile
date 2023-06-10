import 'dart:async';
import 'ModifierProd.dart';
import '../Produit.dart';
import 'package:flutter/material.dart';

class AffichageProd extends StatefulWidget {
  const AffichageProd({Key? key}) : super(key: key);

  @override
  State<AffichageProd> createState() => _AffichageProdState();
}

final List _pages = [
  "/listeProduit","/listeUser"
];

class _AffichageProdState extends State<AffichageProd> {
  late Future<List> _produit;

  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    _produit = Produit.getAllproduit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des produits"),
      ),
      body: FutureBuilder<List>(
        future: _produit,
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
                            snapshot.data![i]['NomProduit'].toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            snapshot.data![i]['PrixProduit'].toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            snapshot.data![i]['StockProduit'].toString(),
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
                                                        ["IdProduit"]
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
                                                    'Êtes-vous sûr de vouloir supprimer cet produit ? '),
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
                                                              Produit.Delete(
                                                                  context,
                                                                  int.parse(snapshot
                                                                      .data![i]
                                                                          ["IdProduit"]
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
          Navigator.pushNamed(context, '/ajoutProduit');
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => Navigator.pushNamed(context, _pages[index]),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_3x3_outlined), label: "Produits"),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail), label: "Comtes"),
        ],
      ),
    );
  }
}
