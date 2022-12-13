import 'dart:convert';

import 'package:final_itk_app/core/constants/url.dart';
import 'package:http/http.dart' as http;

class SerieRepository {
  getSeriesPerPage(int page) async {
    var requestUrl =
        Uri.parse('${AppUrl.seriesServer}${AppUrl.showsPerPage}$page');
    var response = await http.get(requestUrl);
    checkAndThrowError(response);
    var respJson = jsonDecode(response.body);
    return respJson;
  }

  getEpisodesBySerie(int id) async {
    var requestUrl = Uri.parse(
        '${AppUrl.seriesServer}${AppUrl.showInfo}$id${AppUrl.showEpisodes}');
    var response = await http.get(requestUrl);
    checkAndThrowError(response);
    var respJson = jsonDecode(response.body);
    return respJson;
  }

  static void checkAndThrowError(http.Response response) {
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
  }
}
