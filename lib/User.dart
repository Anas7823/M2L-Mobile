import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  static String baseUrl = "http://192.168.1.97:8000"; // Adresse du serveur à modif
  //Penser a faire un ipconfig pour savoir quelle adresse mettre

  static Future<List> getAllUser() async {
    try {
      var res = await http.get(Uri.parse("$baseUrl/utilisateur"));
      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      } else {
        return Future.error("erreur serveur");
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  static Future<List> getUser(int id) async {
    try {
      var res = await http.get(Uri.parse("$baseUrl/utilisateur/$id"));
      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      } else {
        return Future.error("erreur serveur");
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  static Login(BuildContext context, mail, mdp) async {
    try {
      var connection = {"mail": mail, "mdp": mdp};
      String jsonBody = json.encode(connection);
      print(mail);
      print(mdp);
      var res =
          await http.post(Uri.parse("$baseUrl/login"),headers:{"Content-Type": "application/json"},body: jsonBody);
      print(res);
      if (res.statusCode == 200) {
        Navigator.pushNamed(context, '/listeProduit');
      } else {
        Navigator.pushNamed(context, '/');
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  static ajoutUser(BuildContext context, String NomCompte, String MdpCompte,
   int CompteAdmin, String MailCompte, String AdresseCompte) async {
    var body = {
      'nom': NomCompte,
      'admin': CompteAdmin.toString(),
      'mail': MailCompte,
      'adress': AdresseCompte,
    };
    if (MdpCompte != "") {
      body['mdp'] = MdpCompte;
    }
    try {
      var res = await http.post(
        Uri.parse("$baseUrl/utilisateur"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'nom': NomCompte,
          'mdp': MdpCompte,
          'admin': CompteAdmin.toString(),
          'mail': MailCompte,
          'adress': AdresseCompte,
        }),
      );
      if (res.statusCode == 200) {
        Navigator.pushNamed(context, '/listeUser');
      } else {
        Navigator.pushNamed(context, '/');
      }
    } catch (error) {
      return Future.error(error);
    }
  }

  static Update(BuildContext context, int id, String NomCompte, String MdpCompte,
  int CompteAdmin, String MailCompte, String AdresseCompte) async {
    try {
      var res = await http.put(
        Uri.parse("$baseUrl/utilisateur/$id"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'nom': NomCompte,
          'mdp': MdpCompte,
          'admin': CompteAdmin.toString(),
          'mail': MailCompte,
          'id': id.toString()
        }),
      );
      if (res.statusCode == 200) {
        Navigator.pushNamed(context, '/listeUser');
      } else {
        Navigator.pushNamed(context, '/');
      }
    } catch (error) {
      return Future.error(error);
    }
  }

  static Delete(BuildContext context, int id) async {
    var res = await http.delete(Uri.parse("$baseUrl/utilisateur/$id"),
        body: id.toString());
    if (res.statusCode == 200) {
      Navigator.pushNamed(context, '/listeUser');
    } else {
      Navigator.pushNamed(context, '/');
    }
  }
}
