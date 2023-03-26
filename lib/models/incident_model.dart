import 'package:alertas/models/models.dart';

class IncidentModel {
  IncidentModel({
    required this.id,
    required this.tipoIncidente,
    required this.longitud,
    required this.latitud,
    required this.fecha,
    required this.hora,
    required this.fechaCreacion,
    required this.datosCiudadano,
    required this.estadoDisplay,
    required this.tipoOrigenDisplay,
  });

  int id;
  IncidentTypeModel tipoIncidente;
  double longitud;
  double latitud;
  String fecha;
  String hora;
  String fechaCreacion;
  CitizenModel datosCiudadano;
  String estadoDisplay;
  String tipoOrigenDisplay;

  factory IncidentModel.fromJson(Map<String, dynamic> json) => IncidentModel(
        id: json["id"],
        tipoIncidente: IncidentTypeModel.fromJson(json["tipoIncidente"]),
        longitud: json["longitud"]?.toDouble(),
        latitud: json["latitud"]?.toDouble(),
        fecha: json["fecha"],
        hora: json["hora"],
        fechaCreacion: json["fechaCreacion"],
        datosCiudadano: CitizenModel.fromJson(json["datosCiudadano"]),
        estadoDisplay: json["estado_display"],
        tipoOrigenDisplay: json["tipoOrigen_display"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipoIncidente": tipoIncidente.toJson(),
        "longitud": longitud,
        "latitud": latitud,
        "fecha": fecha,
        "hora": hora,
        "fechaCreacion": fechaCreacion,
        "datosCiudadano": datosCiudadano.toJson(),
        "estado_display": estadoDisplay,
        "tipoOrigen_display": tipoOrigenDisplay,
      };
}
