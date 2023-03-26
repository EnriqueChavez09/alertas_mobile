import 'package:alertas/models/models.dart';
import 'package:alertas/services/services.dart';
import 'package:alertas/theme/theme.dart';
import 'package:alertas/ui/common/common.dart';
import 'package:flutter/material.dart';

class RegisterIncidentWidget extends StatefulWidget {
  List<IncidentTypeModel> listIncidentTypesModel;
  RegisterIncidentWidget({
    required this.listIncidentTypesModel,
  });
  @override
  State<RegisterIncidentWidget> createState() => _RegisterIncidentWidgetState();
}

class _RegisterIncidentWidgetState extends State<RegisterIncidentWidget> {
  int? _value;

  registerIncident() async {
    await AlertService.registerIncident(_value!);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          16.0,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              "Enviar Alerta",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppTheme.secondaryColor,
              ),
            ),
          ),
          const Divider(),
          DropdownButton(
            isExpanded: true,
            borderRadius: BorderRadius.circular(16.0),
            underline: const SizedBox(),
            items: [
              ...List.generate(
                widget.listIncidentTypesModel.length,
                (index) => DropdownMenuItem(
                  value: widget.listIncidentTypesModel[index].id,
                  child: Text(
                    widget.listIncidentTypesModel[index].titulo,
                  ),
                ),
              ),
            ],
            value: _value,
            onChanged: (int? value) {
              _value = value;
              setState(() {});
            },
          ),
          const SizedBox(
            height: 12.0,
          ),
          CustomButtonWidget(
            title: "Enviar Alerta",
            onPressed: () {
              registerIncident();
              setState(() {});
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
