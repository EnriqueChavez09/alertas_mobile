import 'package:alertas/models/models.dart';
import 'package:alertas/services/services.dart';
import 'package:alertas/theme/theme.dart';
import 'package:alertas/ui/common/common.dart';
import 'package:alertas/utils/types.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _fullNameController = TextEditingController();

  final TextEditingController _dniController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void register() {
    if (_formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      UserModel userModel = UserModel(
        nombreCompleto: _fullNameController.text,
        dni: _dniController.text,
        telefono: _phoneController.text,
        direccion: _addressController.text,
        password: _passwordController.text,
      );
      AuthService.register(userModel).then((value) {
        Navigator.pushNamed(
          context,
          "login",
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
                        "Registrar",
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
                        labelText: "Nombre Completo",
                        hintText: "Ingresa tu nombre completo",
                        type: InputType.text,
                        controller: _fullNameController,
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
                      CustomTextFieldWidget(
                        labelText: "Celular",
                        hintText: "Ingresa tu celular",
                        type: InputType.phone,
                        controller: _phoneController,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomTextFieldWidget(
                        labelText: "Dirección",
                        hintText: "Ingresa tu dirección",
                        type: InputType.text,
                        controller: _addressController,
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
                        title: "Registrar",
                        onPressed: () {
                          register();
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "¿Ya tienes una cuenta?",
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "login");
                            },
                            child: Text(
                              "Iniciar sesión",
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
