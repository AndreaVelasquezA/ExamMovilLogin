
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthController{

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

Future loginUser() async {
  const url = 'https://api.npoint.io/b6c51f9c6993e1ade68f';

  var response = await http.post(Uri.parse(url),
   body : jsonEncode({
    "username": usernameController.text,
    "password" : passwordController.text,

  }));

  if(response.statusCode==200){
    var loginArr = json.decode(response.body);
    print(loginArr);
  }else{
    print(response.body);

  }
}

}