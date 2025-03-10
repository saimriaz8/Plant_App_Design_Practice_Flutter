import 'package:flutter/material.dart';
import 'package:plant_screen_design_flutter/plant_model_class.dart';

typedef AddToFavorite = void Function(Plant plant);

class PlantListTile extends StatelessWidget {
  final Plant plant;
  final Animation<Color?> contentColorAniamtion;
  final AddToFavorite onPressedFavorite;
  const PlantListTile(
      {super.key,
      required this.plant,
      required this.contentColorAniamtion,
      required this.onPressedFavorite});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          minRadius: 25,
          maxRadius: 30,
          backgroundImage: NetworkImage(plant.imageUrl),
        ),
        title: Text(
          plant.title,
        ),
        titleTextStyle: TextStyle(
            color: contentColorAniamtion.value,
            fontFamily: 'Jost',
            fontWeight: FontWeight.bold,
            fontSize: 17),
        subtitle: Text(plant.subtitle),
        subtitleTextStyle: TextStyle(
          color: contentColorAniamtion.value,
        ),
        trailing: IconButton(
          onPressed: () => onPressedFavorite(plant),
          icon: Icon(
            Icons.favorite,
            size: 15,
            color: plant.isFavorite ? const Color(0xffD84040) : const Color(0xff9B9B9B),
          ),
        ));
  }
}
