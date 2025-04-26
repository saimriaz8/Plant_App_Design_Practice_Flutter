import 'package:flutter/material.dart';
import 'package:plant_screen_design_flutter/plant_list_tile.dart';
import 'package:plant_screen_design_flutter/plant_model_class.dart';

class PlantListView extends StatelessWidget {
  final List<Plant> listOfPlants;
  final Animation<Color?> contentColorAnimation;
  final Animation<Color?> backGroundColorAniamtion;
  final AddToFavorite onPressedFavorite;
  final bool isGridView;
  final double width;
  final double height;
  const PlantListView(
      {super.key,
      required this.listOfPlants,
      required this.contentColorAnimation,
      required this.onPressedFavorite,
      required this.isGridView,
      required this.backGroundColorAniamtion,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return isGridView
        ? GridView.custom(
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: width * 0.5),
            childrenDelegate: SliverChildBuilderDelegate(
              childCount: listOfPlants.length,
              (context, index) => PlantListTile(
                plant: listOfPlants[index],
                onPressedFavorite: onPressedFavorite,
                contentColorAniamtion: contentColorAnimation,
                isGridView: isGridView,
                backgroundColorAniamtion: backGroundColorAniamtion,
                height: height,
                width: width,
              ),
            ))
        : ListView(
            physics: const BouncingScrollPhysics(),
            children: listOfPlants
                .map(
                  (e) => PlantListTile(
                    plant: e,
                    contentColorAniamtion: contentColorAnimation,
                    onPressedFavorite: onPressedFavorite,
                    isGridView: isGridView,
                    backgroundColorAniamtion: backGroundColorAniamtion,
                    height: height,
                    width: width,
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
