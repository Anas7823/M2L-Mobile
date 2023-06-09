import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Produit {
  static String baseUrl = "http://localhost:8000";

  static Future<List> getAllproduit() async {
    try {
      var res = await http.get(Uri.parse("$baseUrl/produit"));
      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      } else {
        return Future.error("erreur serveur");
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  static Future<List> getproduit(int id) async {
    try {
      var res = await http.get(Uri.parse("$baseUrl/produit/$id"));
      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      } else {
        return Future.error("erreur serveur");
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  static Login(BuildContext context, login, password) async {
    try {
      var connection = {"email": login, "password": password};
      var res =
          await http.post(Uri.parse("$baseUrl/connexion"), body: connection);
      if (res.statusCode == 200) {
        Navigator.pushNamed(context, '/listeProd');
      } else {
        Navigator.pushNamed(context, '/');
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  static ajoutProd(BuildContext context, String NomProduit, Float PrixProduit, Int StockProduit, Int IdSport) async {
    try {
      var res = await http.post(
        Uri.parse("$baseUrl/produit"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'NomProduit': NomProduit,
          'PrixProduit': PrixProduit.toString(),
          'StockProduit': StockProduit.toString(),
          'IdSport': IdSport.toString()
        }),
      );
      if (res.statusCode == 200) {
        Navigator.pushNamed(context, '/listeProd');
      } else {
        Navigator.pushNamed(context, '/');
      }
    } catch (error) {
      return Future.error(error);
    }
  }

  static Update(BuildContext context, int id, String NomProduit, Float PrixProduit, Int StockProduit, Int IdSport) async {
    try {
      var res = await http.put(
        Uri.parse("$baseUrl/produit/$id"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'NomProduit': NomProduit,
          'PrixProduit': PrixProduit.toString(),
          'StockProduit': StockProduit.toString(),
          'IdSport': IdSport.toString(),
          'id': id.toString()
        }),
      );
      if (res.statusCode == 200) {
        Navigator.pushNamed(context, '/listeProd');
      } else {
        Navigator.pushNamed(context, '/');
      }
    } catch (error) {
      return Future.error(error);
    }
  }

  static Delete(BuildContext context, int id) async {
    var res = await http.delete(Uri.parse('$baseUrl/produit/$id'),
        body: id.toString());
    if (res.statusCode == 200) {
      Navigator.pushNamed(context, '/listeProd');
    } else {
      Navigator.pushNamed(context, '/');
    }
  }
}
