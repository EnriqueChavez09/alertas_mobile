import 'dart:async';
import 'dart:convert';
import 'package:alertas/globals/globals.dart';
import 'package:alertas/models/models.dart';
import 'package:http/http.dart' as http;

class IncidentTypeService {
  static Future<List<IncidentTypeModel>> geListIncidentTypes() async {
    Uri url = Uri.parse("${EnvironmentGlobal.apiUrl}incidentes/tipos/");

    http.Response response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      String dataConvert = const Utf8Decoder().convert(response.bodyBytes);
      List data = json.decode(dataConvert);
      List<IncidentTypeModel> listIncidentTypeModel = [];
      listIncidentTypeModel =
          data.map((e) => IncidentTypeModel.fromJson(e)).toList();
      return listIncidentTypeModel;
    }
    return [];
  }
}
