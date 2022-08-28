import 'dart:convert';
import 'dart:io';

import '../models/login_get_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginRemoteDataSource {
  Future<LoginGetModel> nativeLogin({required String loginBody});
}

class LoginRemoteDataSourceImplement implements LoginRemoteDataSource {
  final http.Client client;

  LoginRemoteDataSourceImplement({required this.client});

  @override
  Future<LoginGetModel> nativeLogin({required String loginBody}) async {
    //final url = Uri.https('https://');
    var response = {
        'accessToken': '12345abcde',
        'refreshToken': '12345abc',
        'idToken': '12345'

    };//await client.post(url, body: '');
    return LoginGetModel.fromJson(response);
  }
}