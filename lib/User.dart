import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  static String baseUrl = "http://192.168.1.97:8000";

  static Future<List> getAllUser() async {
    try {
      var res = await http.get(Uri.parse("$baseUrl/compte"));
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
      var res = await http.get(Uri.parse("$baseUrl/compte/$id"));
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
      var res =
          await http.post(Uri.parse("$baseUrl/login"), body: connection);
      if (res.statusCode == 200) {
        Navigator.pushNamed(context, '/listeUser');
      } else {
        Navigator.pushNamed(context, '/');
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  static ajoutUser(BuildContext context, String NomCompte, String MdpCompte, Bool CompteAdmin,
      String MailCompte, String AdresseCompte) async {
    try {
      var res = await http.post(
        Uri.parse("$baseUrl/compte"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'NomCompte': NomCompte,
          'MdpCompte': MdpCompte,
          'CompteAdmin': CompteAdmin.toString(),
          'MailCompte': MailCompte,
          'AdresseCompte': AdresseCompte
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

  static Update(BuildContext context, int id, String theme, String compte,
      String reponse) async {
    try {
      var res = await http.put(
        Uri.parse("$baseUrl/compte/$id"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'theme': theme,
          'compte': compte,
          'reponse': reponse,
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
    var res = await http.delete(Uri.parse('$baseUrl/compte/$id'),
        body: id.toString());
    if (res.statusCode == 200) {
      Navigator.pushNamed(context, '/listeUser');
    } else {
      Navigator.pushNamed(context, '/');
    }
  }
}
