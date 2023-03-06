import 'dart:convert';

import 'package:examen_movil/config.dart';
import 'package:examen_movil/models/login_request_model.dart';
import 'package:examen_movil/models/login_response_model.dart';
import 'package:examen_movil/models/register_request_model.dart';
import 'package:examen_movil/models/register_response_model.dart';
import 'package:examen_movil/services/shared_servide.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async{
    Map<String, String> requestHeaders = {
      'Content-Type' : 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.loginAPI);

    var response = await client.post(
      url, 
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200){
      //SHARED

      await SharedService.setLoginDetails(loginResponseJson(response.body));

      return true;
    }else{
      return false;
    }
  }


  static Future<RegisterResponseModel> register(RegisterRequestModel model) async{
    Map<String, String> requestHeaders = {
      'Content-Type' : 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.registerAPI);

    var response = await client.post(
      url, 
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return registerResponseModel(response.body);
  }


}