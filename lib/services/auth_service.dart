import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:alertas/globals/globals.dart';
import 'package:alertas/models/models.dart';
import 'package:alertas/utils/sp_global.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static Future<UserModel?> login(String dni, String password) async {
    try {
      Uri url = Uri.parse("${EnvironmentGlobal.apiUrl}login/");

      http.Response response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(
          {
            "username": dni,
            "password": password,
          },
        ),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        UserModel userModel = UserModel.fromJson(data["user"]);
        SPGlobal().setBool("isLogin", true);
        SPGlobal().setString("token", data["access"]);
        SPGlobal().setString("fullName", data["user"]["nombreCompleto"]);
        SPGlobal().setString("dni", data["user"]["dni"]);
        SPGlobal().setString("address", data["user"]["direccion"]);
        return userModel;
      }
      if (response.statusCode == 400) {
        throw {"message": "Credenciales incorrectas"};
      }
      throw {"message": "Error fatal"};
    } on TimeoutException catch (e) {
      return Future.error(
        {
          "message": "Huno un inconveniente con el servidor, inténtalo luego",
        },
      );
    } on SocketException catch (e) {
      return Future.error(
        {
          "message": "Huno un inconveniente con el internet, inténtalo luego",
        },
      );
    } on Error catch (e) {
      return Future.error(
        {
          "message": "Huno un inconveniente  , inténtalo luego",
        },
      );
    }
  }

  static Future<UserModel?> register(UserModel model) async {
    try {
      Uri url = Uri.parse("${EnvironmentGlobal.apiUrl}registro/");

      http.Response response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(model.toJson()),
      );
      if (response.statusCode == 201) {
        Map<String, dynamic> data = json.decode(response.body);
        UserModel userModel = UserModel.fromJson(data);
        return userModel;
      }
      if (response.statusCode == 400) {
        throw {"message": "Campos incorrectos"};
      }
      throw {"message": "Error fatal"};
    } on TimeoutException catch (e) {
      return Future.error(
        {
          "message": "Huno un inconveniente con el servidor, inténtalo luego",
        },
      );
    } on SocketException catch (e) {
      return Future.error(
        {
          "message": "Huno un inconveniente con el internet, inténtalo luego",
        },
      );
    } on Error catch (e) {
      return Future.error(
        {
          "message": "Huno un inconveniente  , inténtalo luego",
        },
      );
    }
  }
}
