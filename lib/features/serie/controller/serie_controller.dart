import 'dart:convert';

import 'package:final_itk_app/features/serie/repository/serie_repository.dart';
import 'package:final_itk_app/models/serie.dart';
import 'package:flutter/material.dart';

class SerieController extends ChangeNotifier {
  List<Serie> series = [];
  int page = 0;
  bool loading = false;
  ScrollController controllerSeriesList = ScrollController();
  addPage() {
    page++;
  }

  SerieController() {
    addSeries();
    controllerSeriesList.addListener(_scrollListener);
  }
  _scrollListener() async {
    // print(controllerSeriesList.offset);
    // print(controllerSeriesList.position.maxScrollExtent);
    // print(controllerSeriesList.position.outOfRange);
    // if (controllerSeriesList.offset >=
    //     controllerSeriesList.position.maxScrollExtent &&
    // !controllerSeriesList.position.outOfRange) {
    // print(controllerSeriesList.position.pixels.roundToDouble());
    // print(controllerSeriesList.position.maxScrollExtent);

    if (controllerSeriesList.offset + 1000 >=
            controllerSeriesList.position.maxScrollExtent &&
        loading == false) {
      print('bottom');
      addPage();
      print(page);
      await addSeries();
    }
  }

  addSeries() async {
    loading = true;
    series.addAll(await getSeriesPerPage(page));
    loading = false;
    notifyListeners();
  }

  getSeriesPerPage(int page) async {
    var response = await SerieRepository().getSeriesPerPage(page);
    var respJson = jsonDecode(response);
    return respJson.map<Serie>((serie) => Serie.fromJson(serie)).toList();
  }
}
