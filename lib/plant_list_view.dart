import 'package:flutter/material.dart';
import 'package:plant_screen_design_flutter/plant_list_tile.dart';
import 'package:plant_screen_design_flutter/plant_model_class.dart';

class PlantListView extends StatelessWidget {
  final List<Plant> listOfPlants;
  final Animation<Color?> contentColorAnimation;
   final AddToFavorite onPressedFavorite;
  const PlantListView(
      {super.key,
      required this.listOfPlants,
      required this.contentColorAnimation,
      required this.onPressedFavorite});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: listOfPlants
          .map(
            (e) => PlantListTile(
              plant: e,
              contentColorAniamtion: contentColorAnimation,
              onPressedFavorite: onPressedFavorite,
            ),
          )
          .toList(),
    );
  }
}



// ListView.separated(
//         itemBuilder: (context, index) =>
//             PlantListTile(plant: listOfPlants[index]),
//         separatorBuilder: (context, index) => const Divider(),
//         itemCount: listOfPlants.length);
