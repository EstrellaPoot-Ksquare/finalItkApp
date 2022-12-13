import 'package:final_itk_app/core/routes/route_generator.dart';
import 'package:final_itk_app/core/styles/app_theme.dart';
import 'package:final_itk_app/features/serie/controller/serie_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SerieController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.theme,
        initialRoute: '/series-list',
        onGenerateRoute: RouteGenerator().routes,
      ),
    );
  }
}
