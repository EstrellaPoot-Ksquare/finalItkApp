import 'package:final_itk_app/core/constants/colors.dart';
import 'package:final_itk_app/features/serie/controller/serie_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SerieDetailScreen extends StatelessWidget {
  const SerieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<SerieController>(
      builder: (context, provider, child) {
        var serie = provider.currentSerie;
        return SafeArea(
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              title: Text('${serie.name}'),
              backgroundColor: AppColors.appBarBg.withOpacity(0.7),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.redAccent,
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: double.infinity,
                  child: Image.network(
                    serie.image!.original.toString(),
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 15,
                    bottom: 20,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: AppColors.scaffoldBg,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: AppColors.main, // red as border color
                      ),
                    ),
                    height: 35,
                    child: DropdownButton(
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      iconEnabledColor: AppColors.normalText,
                      dropdownColor: AppColors.main,
                      focusColor: AppColors.main.withOpacity(0.3),
                      underline: const SizedBox(),
                      value: provider.getSeasonNum(),
                      items: provider.getSeasonsForDrowpdown(),
                      onChanged: (int? value) {
                        provider.setSeasonNum(value!);
                        var eps = provider.getSerieEpisodesBySeason();
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    dragStartBehavior: DragStartBehavior.down,
                    padding: const EdgeInsets.only(top: 20, bottom: 40),
                    itemCount: provider.episodesBySeason.length,
                    itemBuilder: (context, index) {
                      var episode = provider.episodesBySeason[index];
                      return provider.loading
                          ? const Center(
                              child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ))
                          : ListTile(
                              leading: SizedBox(
                                width: size.width * 0.2,
                                height: size.height * 0.1,
                                child: Image.network(
                                  episode.image!.original.toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                'Episode ${episode.number}',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
