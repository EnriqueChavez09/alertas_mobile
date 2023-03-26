import 'package:alertas/services/services.dart';
import 'package:alertas/theme/theme.dart';
import 'package:alertas/ui/common/common.dart';
import 'package:alertas/utils/types.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _dniController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void login() {
    if (_formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      AuthService.login(_dniController.text, _passwordController.text)
          .then((value) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          "init",
          (route) => false,
        );
      }).catchError((e) {
        isLoading = false;
        setState(() {});
        Map dataError = e as Map;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              dataError["message"],
            ),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/1/15/Escudo_de_Carabayllo.png",
                        width: 100.0,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Municipalidad Distrital de Carabayllo",
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Alerta Ciudadano",
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontSize: 28.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Iniciar Sesión",
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomTextFieldWidget(
                        labelText: "DNI",
                        hintText: "Ingresa tu DNI",
                        type: InputType.dni,
                        controller: _dniController,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomPasswordWidget(
                        controller: _passwordController,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomButtonWidget(
                        title: "Iniciar Sesión",
                        onPressed: () {
                          login();
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Aún no estás registrado",
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "register");
                            },
                            child: Text(
                              "Regístrate",
                              style: TextStyle(
                                color: AppTheme.secondaryColor,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          isLoading ? LoadingWidget() : const SizedBox(),
        ],
      ),
    );
  }
}
