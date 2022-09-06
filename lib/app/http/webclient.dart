import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'package:paula/app/model/usuario.dart';
import '../model/usuarioAPI.dart';


class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {


    return data;
  }
}

Future<UsuarioAPI?> loginUsuario(String username, String password) async {
  final Client client =
  InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  final String clienteJson = jsonEncode({"username":username,"password":password});

  final Response response = await client.post(
      Uri.http('127.0.0.1:8000', '/login/'),
      headers: {'Content-type': 'application/json'},
      body: clienteJson);

  Map<String, dynamic> json = jsonDecode(response.body);

  if(response.statusCode == 200){
    return UsuarioAPI(json['name'], json['username'], json['gender'], json['age'],
        json['birthdate'], id: json['id'], token: json['token']);
  }


  return null;
}


Future<UsuarioAPI?> cadastroUsuario(Usuario usuario) async {
  final Client client =
  InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  final String clienteJson = jsonEncode(usuario.mapJson());

  final Response response = await client.post(
      Uri.http('127.0.0.1:8000', '/cadastro/'),
      headers: {'Content-type': 'application/json'},
      body: clienteJson);

  Map<String, dynamic> json = jsonDecode(response.body);

  if(response.statusCode == 201){
    return UsuarioAPI(json['name'], json['username'], json['gender'], json['age'],
        json['birthdate']);
  }

  return null;
}