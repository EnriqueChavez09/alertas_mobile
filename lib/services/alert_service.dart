import 'dart:convert';
import 'package:alertas/globals/globals.dart';
import 'package:alertas/models/models.dart';
import 'package:alertas/utils/sp_global.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class AlertService {
  static Future<List<IncidentModel>> geListIncidents() async {
    Uri url = Uri.parse("${EnvironmentGlobal.apiUrl}incidentes/");

    http.Response response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      String dataConvert = const Utf8Decoder().convert(response.bodyBytes);
      List data = json.decode(dataConvert);
      List<IncidentModel> listIncidentModel = [];
      listIncidentModel = data.map((e) => IncidentModel.fromJson(e)).toList();
      return listIncidentModel;
    }
    return [];
  }

  static Future<IncidentModel> registerIncident(int incidentTypeId) async {
    Position position = await Geolocator.getCurrentPosition();
    Uri url = Uri.parse("${EnvironmentGlobal.apiUrl}incidentes/crear/");
    String token = SPGlobal().getString("token");
    http.Response response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Token $token"
      },
      body: json.encode(
        {
          "latitud": position.latitude,
          "longitud": position.longitude,
          "tipoIncidente": incidentTypeId,
          "estado": "Abierto"
        },
      ),
    );
    if (response.statusCode == 201) {
      String dataConvert = const Utf8Decoder().convert(response.bodyBytes);
      Map<String, dynamic> data = json.decode(dataConvert);
      IncidentModel incidentModel = IncidentModel.fromJson(data);
      return incidentModel;
    } else {
      throw {"message": "Hay algún error"};
    }
  }
}
