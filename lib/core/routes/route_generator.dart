import 'package:final_itk_app/features/serie/screens/serie_details_screen.dart';
import 'package:final_itk_app/features/serie/screens/series_list_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  Route<dynamic> Function(RouteSettings) routes = (settings) {
    var routeName = settings.name;
    var args = settings.arguments;
    switch (routeName) {
      case '/series-list':
        return MaterialPageRoute(
          builder: (context) => const SeriesListScreen(),
        );
      case '/serie-details':
        return MaterialPageRoute(
          builder: (context) => const SerieDetailScreen(),
        );
    }
    return MaterialPageRoute(builder: (context) => const SeriesListScreen());
  };
}
