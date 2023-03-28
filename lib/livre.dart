import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Produits{
  static String baseUrl = "http://192.168.143.195:8000/";
  static Future<List> getAllProduits() async{
    print("test");
      var res = await http.get(Uri.parse( baseUrl+"sports"));
      print("res.statusCode");
          try{

      if(res.statusCode == 200){
        return jsonDecode(res.body);
      }
      else{
        return Future.error("erreur serveur");
      }
    }
    catch(err){

      return Future.error(err);
    }
  }

  static Login(BuildContext context, login, password) async{
     try{
      var connection = {"email": login, "password": password};
      var res = await http.post(
        Uri.parse("https://reqres.in/api/login"),
        body: connection
        );
      if(res.statusCode == 200){
        Navigator.pushNamed(context, '/liste');
      }
      else{
        Navigator.pushNamed(context, '/');
      }
    }
    catch(err){
      return Future.error(err);
    }
   }
  static ajout(BuildContext context, title, body) async{
    try{
     
      Map<String,dynamic> data= {"title":title,"body":body};
      var res = await http.post(
        Uri.parse(baseUrl+'/posts'), 
        body: data
        );
      if(res.statusCode == 201){
        Navigator.pushNamed(context, '/liste', arguments: res.body

        );
      }
      else{
        Navigator.pushNamed(context, '/');
      }
    }
    catch(err){
      return Future.error(err);
    }
  }
}