import 'package:alertas/models/models.dart';
import 'package:alertas/services/services.dart';
import 'package:alertas/theme/theme.dart';
import 'package:alertas/ui/common/common.dart';
import 'package:alertas/ui/pages/home_page/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<IncidentModel>? listIncidents;
  List<IncidentTypeModel>? listIncidentTypesModel;

  getListIncidents() async {
    listIncidents = await AlertService.geListIncidents();
    setState(() {});
  }

  getListIncidentTypes() async {
    listIncidentTypesModel = await IncidentTypeService.geListIncidentTypes();
    setState(() {});
  }

  showSendIncident() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return RegisterIncidentWidget(
          listIncidentTypesModel: listIncidentTypesModel!,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getListIncidents();
    getListIncidentTypes();
  }

  @override
  Widget build(BuildContext context) {
    return listIncidents != null
        ? Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showSendIncident();
              },
              backgroundColor: AppTheme.secondaryColor,
              child: const Icon(
                Icons.add,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Alertas Generales",
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: listIncidents!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemAlertWidget(
                            model: listIncidents![index],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : LoadingWidget();
  }
}
