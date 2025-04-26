import 'package:flutter/material.dart';
import 'package:plant_screen_design_flutter/plant_detailed_page.dart';
import 'package:plant_screen_design_flutter/plant_model_class.dart';

typedef AddToFavorite = void Function(Plant plant);

class PlantListTile extends StatelessWidget {
  final Plant plant;
  final Animation<Color?> contentColorAniamtion;
  final Animation<Color?> backgroundColorAniamtion;
  final AddToFavorite onPressedFavorite;
  final bool isGridView;
  final double width;
  final double height;
  const PlantListTile(
      {super.key,
      required this.plant,
      required this.contentColorAniamtion,
      required this.onPressedFavorite,
      required this.backgroundColorAniamtion,
      required this.isGridView,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    void onPressedDetailedPage() {
      ({Plant plant, Animation<Color?> contentColorAniamtion, Animation<Color?> backgroundColorAniamtion}) record = (plant: plant, contentColorAniamtion: contentColorAniamtion, backgroundColorAniamtion: backgroundColorAniamtion);
      Navigator.pushNamed(context, PlantDetailedPage.pageName,
          arguments: record);
    }

    return isGridView
        ? GestureDetector(
            onTap: onPressedDetailedPage,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                width: width * 0.45,
                height: 250,
                color: backgroundColorAniamtion.value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: NetworkImage(plant.imageUrl),
                              fit: BoxFit.cover)),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Text(
                              plant.title,
                              style: TextStyle(
                                  color: contentColorAniamtion.value,
                                  fontFamily: 'Jost',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 2),
                            child: IconButton(
                              onPressed: () => onPressedFavorite(plant),
                              icon: Icon(
                                Icons.favorite,
                                size: 15,
                                color: plant.isFavorite
                                    ? const Color(0xffD84040)
                                    : const Color(0xff9B9B9B),
                              ),
                            ),
                          ),
                        ]),
                    Text(plant.subtitle,
                        style: TextStyle(
                          color: contentColorAniamtion.value,
                        )),
                  ],
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: onPressedDetailedPage,
            child: ListTile(
                leading: Hero(
                  tag: plant.title,
                  flightShuttleBuilder: (flightContext, animation,
                      flightDirection, fromHeroContext, toHeroContext) {
                    return RotationTransition(
                      turns: animation.drive(Tween(begin: 0.0, end: 5.0)),
                      child: fromHeroContext.widget,
                    );
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(110), // half of width/height
                      child: Image.network(
                        plant.imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return  Center(
                              child: CircularProgressIndicator(
                                color: contentColorAniamtion.value,
                              ));
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                              child: Icon(Icons.error, size: 50));
                        },
                      ),
                    ),
                  ),
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
                    color: plant.isFavorite
                        ? const Color(0xffD84040)
                        : const Color(0xff9B9B9B),
                  ),
                )),
          );
  }
}
