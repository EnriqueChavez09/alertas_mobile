import 'package:alertas/models/models.dart';
import 'package:alertas/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemAlertWidget extends StatelessWidget {
  IncidentModel model;
  ItemAlertWidget({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListTile(
        title: Text(
          model.tipoIncidente.titulo,
          style: TextStyle(
            color: AppTheme.primaryColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.datosCiudadano.nombres,
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontSize: 14.0,
              ),
            ),
            Text(
              model.datosCiudadano.dni,
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontSize: 14.0,
              ),
            ),
            Text(
              model.fechaCreacion,
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                Uri uriPhone =
                    Uri(scheme: "tel", path: model.datosCiudadano.telefono);
                launchUrl(uriPhone);
              },
              icon: Icon(
                Icons.phone_outlined,
                color: AppTheme.primaryColor,
              ),
            ),
            IconButton(
              onPressed: () {
                Uri url = Uri.parse(
                    "http://maps.google.com/?q=${model.latitud},${model.longitud}");
                launchUrl(url, mode: LaunchMode.externalApplication);
              },
              icon: Icon(
                Icons.map,
                color: AppTheme.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
