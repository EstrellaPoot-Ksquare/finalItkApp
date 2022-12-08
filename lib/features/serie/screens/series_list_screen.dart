import 'package:final_itk_app/features/serie/controller/serie_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeriesList extends StatelessWidget {
  const SeriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of series'),
      ),
      body: Consumer<SerieController>(
        builder: (context, provider, child) {
          // print('series: ${provider.series}');
          var series = provider.series;
          return Column(
            children: [
              Flexible(
                flex: provider.loading ? 5 : 6,
                child: ListView.builder(
                  controller: provider.controllerSeriesList,
                  itemCount: series.length,
                  itemBuilder: (context, index) {
                    var serie = series[index];
                    return ListTile(
                      leading: Text(
                        '${serie.id}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        '${series[index].name}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (provider.loading)
                Flexible(
                  flex: provider.loading ? 1 : 0,
                  child: const CircularProgressIndicator(),
                ),
            ],
          );
        },
      ),
    );
  }
}
