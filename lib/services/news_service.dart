import 'dart:convert';

import 'package:alertas/globals/enviroment_global.dart';
import 'package:alertas/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';

class NewsService {
  static Future<List<NewsModel>> geListNews() async {
    Uri url = Uri.parse("${EnvironmentGlobal.apiUrl}noticias/");

    http.Response response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      String dataConvert = const Utf8Decoder().convert(response.bodyBytes);
      List data = json.decode(dataConvert);
      List<NewsModel> listNewsModel = [];
      listNewsModel = data.map((e) => NewsModel.fromJson(e)).toList();
      return listNewsModel;
    }
    return [];
  }

  static Future<NewsModel> registerNews(NewsModel model) async {
    Uri url = Uri.parse("${EnvironmentGlobal.apiUrl}noticias/");
    http.MultipartRequest request = http.MultipartRequest("POST", url);
    // request.headers.addAll({});
    request.fields["titulo"] = model.titulo;
    request.fields["link"] = model.link;
    request.fields["fecha"] = model.fecha.toString().substring(0, 10);
    List<String> dataMime = mime(model.imagen)!.split("/");
    http.MultipartFile file = await http.MultipartFile.fromPath(
      "imagen",
      model.imagen,
      contentType: MediaType(dataMime[0], dataMime[1]),
    );
    request.files.add(file);
    http.StreamedResponse streamResponse = await request.send();
    http.Response response = await http.Response.fromStream(streamResponse);
    if (response.statusCode == 201) {
      String dataConvert = const Utf8Decoder().convert(response.bodyBytes);
      Map<String, dynamic> data = json.decode(dataConvert);
      NewsModel newsModel = NewsModel.fromJson(data);
      return newsModel;
    } else {
      // print(response.body);
      throw {"message": "Hay algún error"};
    }
  }
}
