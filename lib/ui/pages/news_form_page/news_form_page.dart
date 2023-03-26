import 'dart:io';

import 'package:alertas/models/models.dart';
import 'package:alertas/services/news_service.dart';
import 'package:alertas/theme/theme.dart';
import 'package:alertas/ui/common/common.dart';
import 'package:alertas/utils/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';

class NewsFormPage extends StatefulWidget {
  @override
  State<NewsFormPage> createState() => _NewsFormPageState();
}

class _NewsFormPageState extends State<NewsFormPage> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _linkController = TextEditingController();

  ImagePicker imagePicker = ImagePicker();

  XFile? image;
  final formKey = GlobalKey<FormState>();
  String errorMessage = "";
  bool isLoading = false;

  getImageGallery() async {
    image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      errorMessage = "";
      setState(() {});
    }
  }

  getImageCamera() async {
    image = await imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      errorMessage = "";
      setState(() {});
    }
  }

  registerNews() async {
    if (formKey.currentState!.validate() && image != null) {
      errorMessage = "";
      isLoading = true;
      File newImageFile = await FlutterNativeImage.compressImage(image!.path);
      NewsModel newsModel = NewsModel(
        id: 0,
        link: _linkController.text,
        titulo: _titleController.text,
        fecha: DateTime.now(),
        imagen: newImageFile.path,
      );
      NewsService.registerNews(newsModel).then((value) {
        isLoading = false;
        Navigator.pop(context);
      }).catchError((error) {
        isLoading = false;
        setState(() {});
      });
    }
    if (image == null) {
      errorMessage = "Selecciona una imagen";
      setState(() {});
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
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 20.0,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Text(
                        "Registrar Noticia",
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextFieldWidget(
                        labelText: "Título",
                        hintText: "Ingresa un título",
                        type: InputType.text,
                        controller: _titleController,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomTextFieldWidget(
                        labelText: "Link",
                        hintText: "Ingresa un link",
                        type: InputType.text,
                        controller: _linkController,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.secondaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              onPressed: () {
                                getImageGallery();
                              },
                              icon: const Icon(Icons.image),
                              label: const Text(
                                "Galería",
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.secondaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              onPressed: () {
                                getImageCamera();
                              },
                              icon: const Icon(Icons.camera),
                              label: const Text(
                                "Cámara",
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      image != null
                          ? Image.file(
                              File(image!.path),
                              height: 350.0,
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        errorMessage,
                        style: TextStyle(
                          color: AppTheme.sextonaryColor,
                          fontSize: 11.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomButtonWidget(
                title: "Registrar",
                onPressed: () {
                  registerNews();
                },
              ),
            ),
          ),
          isLoading
              ? Container(
                  color: AppTheme.primaryColor.withOpacity(0.6),
                  child: LoadingWidget(),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
