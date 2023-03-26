import 'package:alertas/theme/theme.dart';
import 'package:alertas/ui/pages/profile_page/widgets/widgets.dart';
import 'package:alertas/utils/sp_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
          ),
          child: Column(
            children: [
              Text(
                "Perfil",
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SvgPicture.asset(
                "assets/images/profile.svg",
                height: 200.0,
              ),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                SPGlobal().getString("fullName"),
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                SPGlobal().getString("address"),
                style: TextStyle(
                  color: AppTheme.primaryColor.withOpacity(0.4),
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ItemProfileWidget(
                text: "Editar perfil",
                icon: Icons.person,
              ),
              ItemProfileWidget(
                text: "Notificaciones",
                icon: Icons.notifications,
              ),
              ItemProfileWidget(
                text: "Configuración",
                icon: Icons.settings,
              ),
              ItemProfileWidget(
                text: "Cerrar Sesión",
                icon: Icons.logout,
                onTap: () {
                  SPGlobal().setBool("isLogin", false);
                  SPGlobal().setString("token", "");
                  Navigator.pushNamedAndRemoveUntil(
                      context, "login", (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
