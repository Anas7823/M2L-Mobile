import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/livre.dart';

class Affichage extends StatefulWidget {
  const Affichage({ Key? key }) : super(key: key);

  @override
  State<Affichage> createState() => _AffichageState();
}

class _AffichageState extends State<Affichage> {
  
  late Future<List> _produitList;
  @override 
  void initState() {
    // TODO: implement initState
    super.initState();
    _produitList = Produits.getAllProduits();
  }
  @override
  Widget build(BuildContext context) {
    if(ModalRoute.of(context)!.settings.arguments != null){
      Object? arg = ModalRoute.of(context)!.settings.arguments;
      var newProduit= jsonDecode(arg.toString());
       setState(() {
         _produitList = _produitList.then<List>((value) {return [newProduit, ...value];});
      });
    }
     return Scaffold(
      appBar: AppBar(
        title: const Text("liste livres"),
      ),
      body: Container(
        child: FutureBuilder<List>(
          future: _produitList,
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, i){
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data![i]['NomProduit'], style: const TextStyle(fontSize: 30),),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(snapshot.data![i]['PrixProduit'].toString(), style: const TextStyle(fontSize: 20)),
                      ]),
                    ),
                  );
                }
                );
            }
            else{
              return const Center(
                child: Text("Pas de données"),
              );
            }
          },
        ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/ajout');
          },
          child: const Text("+"),
      ),  
    );
  }
}