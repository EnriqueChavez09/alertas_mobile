import 'package:alertas/models/models.dart';
import 'package:alertas/services/services.dart';
import 'package:alertas/theme/theme.dart';
import 'package:alertas/ui/common/common.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Set<Marker> myMarkes = {};
  List<IncidentModel>? listIncidentsModel = null;

  getListIncidents() async {
    listIncidentsModel = await AlertService.geListIncidents();
    getMarkers();
    setState(() {});
  }

  void showIncidentDetail(IncidentModel model) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  "Detalle de la alerta",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.secondaryColor,
                  ),
                ),
              ),
              const Divider(),
              Text(
                "Tipo: ${model.tipoIncidente.titulo}",
              ),
              Text(
                "Nombres: ${model.datosCiudadano.nombres}",
              ),
              Text(
                "DNI: ${model.datosCiudadano.dni}",
              ),
              Text(
                "Celular: ${model.datosCiudadano.telefono}",
              ),
              const SizedBox(
                height: 12.0,
              ),
              CustomButtonWidget(
                title: "Aceptar",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  getMarkers() {
    listIncidentsModel!.forEach((item) {
      Marker myMarker = Marker(
          onTap: () {
            showIncidentDetail(item);
          },
          markerId: MarkerId(
            myMarkes.length.toString(),
          ),
          position: LatLng(item.latitud, item.longitud));
      myMarkes.add(myMarker);
    });
  }

  @override
  void initState() {
    super.initState();
    getListIncidents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listIncidentsModel != null
          ? GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(-16.378531, -71.558272),
                zoom: 10.0,
              ),
              // onTap: (LatLng argument) {
              //   Marker marker = Marker(
              //     markerId: MarkerId("value"),
              //     position: argument,
              //   );
              //   myMarkes.add(marker);
              //   setState(() {});
              // },
              markers: myMarkes,
            )
          : LoadingWidget(),
    );
  }
}
