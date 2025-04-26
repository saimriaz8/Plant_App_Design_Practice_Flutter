import 'package:flutter/material.dart';
import 'package:plant_screen_design_flutter/plant_model_class.dart';

class PlantDetailedPage extends StatefulWidget {
  const PlantDetailedPage({super.key});

  static const String pageName = 'plantdetailedpage';

  @override
  State<PlantDetailedPage> createState() => _PlantDetailedPageState();
}

class _PlantDetailedPageState extends State<PlantDetailedPage> {
  @override
  Widget build(BuildContext context) {
    final record = ModalRoute.of(context)?.settings.arguments as ({
      Plant plant,
      Animation<Color?> contentColorAniamtion,
      Animation<Color?> backgroundColorAniamtion
    });

    var size = MediaQuery.sizeOf(context);
    final Size(:width, :height) = size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: width,
                height: height * 0.3,
                color: record.backgroundColorAniamtion.value,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        record.plant.backgroundImageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                                  color: record.contentColorAniamtion.value,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(child: Icon(Icons.error));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: width,
                height: height * 0.7,
                color: record.backgroundColorAniamtion.value,
              ),
            ),
            Positioned(
                left: 50,
                right: 50,
                top: height * (0.3 - 0.11),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: record.contentColorAniamtion.value ??
                                    Colors.black,
                                width: 3)),
                        child: Hero(
                          tag: record.plant.title,
                          child: Container(
                            width: 180,
                            height: 180,
                            decoration:  BoxDecoration(
                              shape: BoxShape.circle,
                              color: record.backgroundColorAniamtion.value
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  100), // half of width/height
                              child: Image.network(
                                record.plant.imageUrl,
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return  Center(
                                      child: CircularProgressIndicator(
                                        color: record.contentColorAniamtion.value,
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
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            record.plant.title,
                            style: TextStyle(
                                color: record.contentColorAniamtion.value,
                                fontFamily: 'Jost',
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(top: 7),
                          child: Text(
                            'Plant Overview',
                            style: TextStyle(
                                color: record.contentColorAniamtion.value,
                                fontFamily: 'Jost',
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          )),
                    ])),
            Positioned(
              top: height * 0.53,
              bottom:
                  0, // Add this to make the scroll view expand and scroll fully
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width,
                      padding: const EdgeInsets.only(
                          left: 8, bottom: 5, top: 5, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Plant type :',
                              style: TextStyle(
                                  color: record.contentColorAniamtion.value,
                                  fontFamily: 'Jost',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Text(record.plant.plantType,
                              style: TextStyle(
                                  color: record.contentColorAniamtion.value,
                                  fontFamily: 'Jost',
                                  fontSize: 19)),
                          const SizedBox(height: 10),
                          Text('Plant family :',
                              style: TextStyle(
                                  color: record.contentColorAniamtion.value,
                                  fontFamily: 'Jost',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Text(record.plant.plantFamily,
                              style: TextStyle(
                                  color: record.contentColorAniamtion.value,
                                  fontFamily: 'Jost',
                                  fontSize: 19)),
                          const SizedBox(height: 10),
                          Text('Plant origin :',
                              style: TextStyle(
                                  color: record.contentColorAniamtion.value,
                                  fontFamily: 'Jost',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Text(record.plant.plantOrigin,
                              style: TextStyle(
                                  color: record.contentColorAniamtion.value,
                                  fontFamily: 'Jost',
                                  fontSize: 19)),
                          const SizedBox(height: 10),
                          Text('🌞 Light Requirements :',
                              style: TextStyle(
                                  color: record.contentColorAniamtion.value,
                                  fontFamily: 'Jost',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Text(record.plant.lightRequirement,
                              style: TextStyle(
                                  color: record.contentColorAniamtion.value,
                                  fontFamily: 'Jost',
                                  fontSize: 19)),
                          const SizedBox(height: 10),
                          Text('💧 Watering :',
                              style: TextStyle(
                                  color: record.contentColorAniamtion.value,
                                  fontFamily: 'Jost',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Text(record.plant.watering,
                              style: TextStyle(
                                  color: record.contentColorAniamtion.value,
                                  fontFamily: 'Jost',
                                  fontSize: 19)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
