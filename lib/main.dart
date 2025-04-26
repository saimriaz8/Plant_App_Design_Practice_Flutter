import 'package:flutter/material.dart';
import 'package:plant_screen_design_flutter/category_buttons.dart';
import 'package:plant_screen_design_flutter/on_generate_route.dart';
import 'package:plant_screen_design_flutter/plant_list_view.dart';
import 'package:plant_screen_design_flutter/plant_model_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: MyHomePage.pageName,
      onGenerateRoute: onGenerateRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  static const String pageName = 'myhomepage';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _backGroundColorAnimation;
  late Animation<Color?> _contentColorAnimation;
  //late Animation<IconData> _switchIconsAnimation;
  late List<Plant> listOfAllPlants;
  bool isAll = true;
  bool isVegetables = false;
  bool isHerbs = false;
  bool isFruit = false;
  bool isGrains = false;
  bool isDarkMode = false;
  bool isLightMode = true;
  bool isGridView = false;

  IconData displayModeIcon = Icons.light_mode;

  void onPressedAll() {
    setState(() {
      isAll = true;
      isFruit = false;
      isHerbs = false;
      isVegetables = false;
      isGrains = false;
    });
  }

  void onPressedVegetables() {
    setState(() {
      isAll = false;
      isFruit = false;
      isHerbs = false;
      isVegetables = true;
      isGrains = false;
    });
  }

  void onPressedHerbs() {
    setState(() {
      isAll = false;
      isFruit = false;
      isHerbs = true;
      isVegetables = false;
      isGrains = false;
    });
  }

  void onPressedFruits() {
    setState(() {
      isAll = false;
      isFruit = true;
      isHerbs = false;
      isVegetables = false;
      isGrains = false;
    });
  }

    void onPressedGrains() {
      setState(() {
        isAll = false;
        isFruit = false;
        isHerbs = false;
        isVegetables = false;
        isGrains = true;
      });
    }

    void onPressedInfo() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('🌱 Plant Identifier App'),
            titleTextStyle: TextStyle(
                fontFamily: 'Jost',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: _contentColorAnimation.value),
            backgroundColor: _backGroundColorAnimation.value,
            content: const Text('''Version: 1.0.0
Developed by: GreenTech Solutions

This app helps users explore and categorize different types of plants, including vegetables, herbs, flowers, and fruits. It provides useful information about their growing seasons, making it easier for users to manage their gardening or plant selection.

🌟 Features:
🌿 Browse plants by category (All, Vegetables, Herbs, Flowers)
📷 View plant details with images and growing seasons
🛠️ Smooth and intuitive UI with tab-based navigation
🎨 Minimal and user-friendly design

📩 Contact Us:
📧 Email: support@greentech.com
🌐 Website: www.greentechplants.com
📱 Phone: +1 234 567 8900'''),
            contentTextStyle: TextStyle(
                fontFamily: 'Jost', color: _contentColorAnimation.value),
          );
        },
      );
    }

    void onPressedDisplayMode() {
      setState(() {
        if (isDarkMode) {
          isLightMode = true;
          isDarkMode = false;
          _animationController.reverse();
        } else if (isLightMode) {
          isDarkMode = true;
          isLightMode = false;
          _animationController.forward();
        }
      });
    }

    late List<Widget> listOfWidgetsForHorizontalListView;

    List<Plant> listOfFavoritePlants = [];

    List<Plant> listOfVegetables = [
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1565195093469-82a4a4d00ed7?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Tomato',
          subtitle: 'Summer and spring',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1683008952458-dc02ac67f382?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Warm-season Fruit (commonly treated as a vegetable)',
          plantFamily: 'Solanaceae (Nightshade family)',
          plantOrigin:
              'Native to western South America, particularly modern-day Peru, tomatoes were first domesticated by indigenous people',
          lightRequirement:
              'Tomatoes require full sun for healthy growth, needing at least 6 to 8 hours of direct sunlight each day.',
          watering:
              'Tomatoes need consistent watering to produce juicy, well-formed fruit. Water the plants deeply at the base, aiming for 1 to 1.5 inches of water per week, depending on climate and soil type.'),
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1707971892483-707b0360f963?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Spinach',
          subtitle: 'Winter and fall',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1709020847803-ef9ae67d8d37?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Cool-season Leafy Vegetable',
          plantFamily: 'Amaranthaceae (formerly Chenopodiaceae – Beet family)',
          plantOrigin:
              'Native to Persia (modern-day Iran), spinach was introduced to other parts of Asia and Europe centuries ago and is now a globally popular green.',
          lightRequirement:
              'Spinach grows well in full sun to partial shade. It prefers 4 to 6 hours of direct sunlight daily. In warmer climates, partial shade in the afternoon can help prevent the plant from bolting.',
          watering:
              'Spinach requires consistent, even watering to produce tender, flavorful leaves. The soil should be kept moist but not soggy.'),
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1609161307645-3ad8d7cafb55?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Potato',
          subtitle: 'Fall and winter',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1644439017477-befade11bd83?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Cool-season Tuber (Underground stem)',
          plantFamily: 'Solanaceae (Nightshade family)',
          plantOrigin:
              'Native to the Andean region of South America, particularly modern-day Peru and Bolivia. Potatoes have been cultivated for thousands of years and are one of the world’s most important food crops.',
          lightRequirement:
              'Potatoes grow best in full sun, needing at least 6 to 8 hours of direct sunlight daily. Sunlight promotes healthy foliage and helps the plant produce more and larger tubers underground.',
          watering:
              'Potatoes need regular, deep watering for optimal tuber development. Keep the soil evenly moist, especially during tuber formation and bulking.'),
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1595755973454-6f57c3ece624?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Lettuce',
          subtitle: 'Winter and spring',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1622206151226-18ca2c9ab4a1?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Cool-season Leafy Vegetable',
          plantFamily: 'Asteraceae (Daisy family)',
          plantOrigin:
              'Native to the Mediterranean region, lettuce has been cultivated since ancient Egyptian times and remains a key ingredient in salads worldwide.',
          lightRequirement:
              'Lettuce prefers full sun but can tolerate partial shade, especially in warmer climates. Ideally, it should receive 4 to 6 hours of direct sunlight daily.',
          watering:
              'Lettuce needs consistent, shallow watering. The soil should be kept consistently moist, as dry conditions can cause bitterness and stunted growth.'),
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1602496875335-b0fc93069cf9?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Carrot',
          subtitle: 'Winter and fall',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1663441041768-7fc660ae49d9?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Cool-season Root Vegetable',
          plantFamily: 'Apiaceae (Carrot or Parsley family)',
          plantOrigin:
              "Native to Persia (modern-day Iran and Afghanistan), carrots were originally cultivated for their aromatic leaves and seeds before the root became the main crop.",
          lightRequirement:
              'Carrots prefer full sun, needing at least 6 hours of direct sunlight per day. While they can tolerate partial shade, especially in hot climates.',
          watering:
              'Carrots need consistent, deep watering to grow straight and tender roots. Keep the soil evenly moist—not dry and not waterlogged.'),
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1697345208214-7deed24fb445?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Cabbage',
          subtitle: 'Winter and fall',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1486328228599-85db4443971f?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Cool-season Leafy Vegetable',
          plantFamily: 'Brassicaceae (Mustard family)',
          plantOrigin:
              'Native to Europe, cabbage has been cultivated for thousands of years and was a staple in ancient Roman and Greek diets.',
          lightRequirement:
              'Cabbage grows best in full sun, needing at least 6 hours of direct sunlight per day. It can tolerate some partial shade, especially in warmer regions.',
          watering:
              'Cabbage requires consistent and even watering throughout the growing season. The soil should be kept moist but not soggy.'),
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1604488943825-f95dc6796ca5?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Bell Pepper',
          subtitle: 'Summer and spring',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1506365069540-904bcc762636?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Warm-season Fruit (commonly used as a vegetable)',
          plantFamily: 'Solanaceae (Nightshade family)',
          plantOrigin:
              ' Native to Central and South America, bell peppers have been cultivated for centuries and are now grown worldwide in warm climates.',
          lightRequirement:
              'Bell peppers require full sun to thrive. They need 6 to 8 hours of direct sunlight daily for healthy growth and fruit development.',
          watering:
              'Bell peppers need consistent and deep watering. Keep the soil evenly moist, but not waterlogged. Water when the top inch of soil feels dry.'),
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1564894809611-1742fc40ed80?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Beans',
          subtitle: 'Spring and summer',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1647049052430-d7d270f38298?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: ' Annual Legume (Vegetable)',
          plantFamily: 'Fabaceae (Legume family)',
          plantOrigin:
              'Native to Central and South America, beans have been an important food crop for thousands of years and are now cultivated globally.',
          lightRequirement:
              'Beans grow best in full sun, needing at least 6 to 8 hours of direct sunlight daily. Adequate sunlight helps with healthy vine growth and abundant pod production.',
          watering:
              'Beans require moderate, consistent watering. Water when the top inch of soil is dry, keeping the soil evenly moist but not soggy. On average, beans need about 1 inch of water per week.'),
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1515589654462-a9881e276b84?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Pumpkin',
          subtitle: 'Summer and fall',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1508322345744-2745200b300f?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Warm-season Fruit (commonly treated as a vegetable)',
          plantFamily: 'Cucurbitaceae (Gourd family)',
          plantOrigin:
              'Native to North America, pumpkins have been cultivated for over 7,500 years and are now grown worldwide, especially in temperate and subtropical regions.',
          lightRequirement:
              "Pumpkins need full sun to thrive. They require at least 6 to 8 hours of direct sunlight each day. More sunlight results in stronger vines and larger, healthier fruit.",
          watering:
              'Pumpkins need regular, deep watering, especially during flowering and fruiting stages. Keep the soil consistently moist, about 1–2 inches of water per week, depending on climate and soil type.'),
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1568584711075-3d021a7c3ca3?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Cauliflower',
          subtitle: 'Spring and summer',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1568584952634-e9bb8a163e28?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Cool-season Vegetable',
          plantFamily: 'Brassicaceae (Mustard family)',
          plantOrigin:
              'Thought to be native to the Mediterranean region, cauliflower has been cultivated for centuries and is now grown worldwide in temperate climates.',
          lightRequirement:
              'Cauliflower needs full sun, with at least 6 hours of direct sunlight each day for healthy development. It prefers cooler temperatures.',
          watering:
              'Cauliflower prefers consistent, even moisture. The soil should be kept moist but not waterlogged, as inconsistent watering can lead to poor head formation or split heads. Aim for about 1 to 1.5 inches of water per week, depending on weather conditions.'),
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1545165311-508ed0c91361?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Radish',
          subtitle: 'Fall and winter',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1743012249840-12390e07ba2c?q=80&w=2041&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Fast-growing Root Vegetable',
          plantFamily: 'Brassicaceae (Mustard family)',
          plantOrigin:
              'Native to Southeast Asia, radishes have been grown since ancient times and are now cultivated globally for their crisp texture and peppery flavor.',
          lightRequirement:
              "Radishes prefer full sun, needing at least 6 hours of direct sunlight daily for optimal root development. They can tolerate partial shade, especially in hotter climates.",
          watering:
              'Radishes need consistent moisture to develop tender, healthy roots. Water regularly to keep the soil evenly moist but not soggy.'),
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1706678200160-f0ecbcd1b3eb?q=80&w=2020&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Onion',
          subtitle: 'Fall and winter',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1591947362265-57dc2512f473?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Biennial Vegetable (commonly grown as an annual)',
          plantFamily: 'Amaryllidaceae (Amaryllis family)',
          plantOrigin:
              'Believed to be native to Central Asia, particularly modern-day Iran and Pakistan.',
          lightRequirement:
              'Onions need full sun to grow well. They require at least 6 hours of direct sunlight each day. Adequate sunlight is essential for bulb development.',
          watering:
              'Onions prefer moderate, consistent watering. The soil should be evenly moist, especially during bulb formation. Water when the top inch of soil feels dry, but avoid overwatering to prevent rot.'),
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1598030413471-23097f7a81be?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Eggplant',
          subtitle: 'Summer and spring',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1659260180173-8d58b38648f8?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Warm-season Vegetable (Fruit-bearing)',
          plantFamily: 'Solanaceae (Nightshade family)',
          plantOrigin:
              'Native to South Asia, particularly India and Sri Lanka, eggplant has been cultivated for centuries and is now grown in warm climates worldwide.',
          lightRequirement:
              'Eggplants need full sun for healthy growth and fruit production. They require at least 6 to 8 hours of direct sunlight daily.',
          watering:
              'Eggplants prefer regular, deep watering to keep the soil consistently moist. Water the plant when the top inch of soil feels dry, but avoid letting the soil become soggy, as this can cause root rot.'),
    ];

    List<Plant> listOfHerbs = [
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1522259629856-5cd0267d12ac?q=80&w=1930&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Basil',
          subtitle: 'Summer and spring',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1610970884954-4d376ecba53f?q=80&w=2118&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Herb',
          plantFamily: 'Lamiaceae (Mint family)',
          plantOrigin:
              'Native to tropical regions of Central Africa and Southeast Asia',
          lightRequirement:
              "Basil loves the sun! It thrives best in 6 to 8 hours of full sunlight per day. If you're growing it indoors, place it near a sunny windowsill or under a grow light.",
          watering:
              "Basil prefers consistently moist soil, but it’s important not to let it get waterlogged. You should water your basil plant whenever the top inch of the soil feels dry to the touch. "),
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1582556135623-653b87486f21?q=80&w=2006&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Mint',
          subtitle: 'Spring and summer',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1715543707087-2cd9dd91d3f5?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Perennial Herb',
          plantFamily: 'Lamiaceae (Mint family)',
          plantOrigin:
              "Native to Europe, Asia, and North Africa — widely naturalized around the world.",
          lightRequirement:
              'Mint grows best in full sun to partial shade. While it thrives in full sunlight (about 4–6 hours a day), it can also adapt well to slightly shadier spots, especially in hot climates.',
          watering:
              'Mint loves moisture and prefers consistently damp soil, but not soggy. It grows best in soil that stays evenly moist without drying out. You should water the plant when the top layer of soil feels dry.'),
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1679061584104-534b7ec4afe6?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Thyme',
          subtitle: 'Spring and summer',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1627775281788-df130d003186?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Perennial Herb',
          plantFamily: 'Lamiaceae (Mint family)',
          plantOrigin: 'Native to the Mediterranean region',
          lightRequirement:
              'Thyme thrives in full sun and needs at least 6 hours of direct sunlight per day to stay healthy and aromatic.',
          watering:
              "Thyme prefers dry conditions and is quite drought-tolerant once established. It's important to allow the soil to dry out completely between waterings."),
    ];

    List<Plant> listOfFruits = [
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1600973385278-731983908fdd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Apple',
          subtitle: 'Winter and fall',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1724921119357-0c6a8e9cb75e?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: "Deciduous Fruit Tree",
          plantFamily: 'Rosaceae (Rose family)',
          plantOrigin:
              'Originally from Central Asia, especially the region of modern-day Kazakhstan. Apples have been cultivated for thousands of years across Europe and Asia.',
          lightRequirement:
              'Apple trees need full sun to produce healthy fruit. Ideally, they should get at least 6 to 8 hours of direct sunlight each day.',
          watering:
              'Young apple trees should be watered deeply once or twice a week, depending on weather and soil conditions.'),
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1552901633-210088e17486?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Banana',
          subtitle: 'Year-round(Tropical)',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1653481006620-dbb70963c713?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Perennial Herb (not a tree!)',
          plantFamily: 'Musaceae',
          plantOrigin:
              'Native to Southeast Asia, especially regions of Malaysia, Indonesia, and the Philippines.',
          lightRequirement:
              'Banana plants thrive in full sun, needing at least 6 to 8 hours of direct sunlight each day for optimal growth and fruit production.',
          watering:
              'Banana plants have high water needs and grow best in consistently moist soil.'),
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1515778767554-42d4b373f2b3?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Grapes',
          subtitle: 'Summer and fall',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1599600525312-a4cb91b87cb4?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Deciduous Climbing Vine',
          plantFamily: 'Vitaceae',
          plantOrigin:
              'Native to the Mediterranean region, Central Europe, and parts of Western Asia.',
          lightRequirement:
              'Grapevines need full sun to produce sweet, high-quality fruit. Ideally, they should receive at least 7–8 hours of direct sunlight daily.',
          watering:
              "Young grapevines require regular watering to establish deep roots. Once mature, grapevines are relatively drought-tolerant."),
      Plant(
          imageUrl:
              'https://plus.unsplash.com/premium_photo-1666299434471-1815114cdccc?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Kiwi',
          subtitle: 'Fall and winter',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1676536960165-2c68c117891f?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Deciduous Climbing Vine',
          plantFamily: 'Actinidiaceae',
          plantOrigin:
              "Native to China, though it became widely cultivated and commercialized in New Zealand, which gave it the name ${"kiwifruit."}",
          lightRequirement:
              'Kiwi vines thrive in full sun, needing at least 6 to 8 hours of direct sunlight per day. While they can tolerate partial shade, more sunlight means better flowering and fruit production.',
          watering:
              'Kiwi plants prefer consistently moist, well-drained soil. Water them deeply and regularly during the growing season, especially during dry spells.'),
      Plant(
          imageUrl:
              'https://plus.unsplash.com/premium_photo-1675188201885-224646e3bcac?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Orange',
          subtitle: 'Fall and winter',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1688733962287-417f7519ad06?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Evergreen Fruit Tree',
          plantFamily: 'Rutaceae',
          plantOrigin:
              'Believed to have originated in Southeast Asia, particularly southern China, northeast India, and Vietnam.',
          lightRequirement:
              'Orange trees need full sun to grow and produce sweet, juicy fruit. They require at least 6 to 8 hours of direct sunlight per day.',
          watering:
              'Orange trees prefer deep, consistent watering, especially during the hot growing season. The soil should stay evenly moist but not soggy.'),
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1659172562836-ab7e46677822?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Plum',
          subtitle: 'Summer',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1684154741246-75da6364103b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Deciduous Fruit Tree',
          plantFamily: 'Rosaceae (Rose family)',
          plantOrigin:
              'Native to Europe and Asia, with a long history of cultivation for its sweet and tart fruit.',
          lightRequirement:
              'Plum trees require full sun to thrive. They need at least 6 hours of direct sunlight daily for optimal fruit production.',
          watering:
              'Plum trees need consistent moisture during the growing season, particularly during fruit development. Water the tree deeply when the soil feels dry about 1–2 inches below the surface.'),
      Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1706059924399-1e26828a627f?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Pineapple',
        subtitle: 'Summer',
        backgroundImageUrl:
            'https://images.unsplash.com/photo-1706059924399-1e26828a627f?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        isFavorite: false,
        plantType: 'Perennial Herb',
        plantFamily: 'Bromeliaceae',
        plantOrigin:
            ' Native to South America, specifically southern Brazil and Paraguay, but now widely cultivated in tropical regions around the world.',
        lightRequirement:
            'Pineapple plants thrive in full sun and require at least 6 to 8 hours of direct sunlight daily to grow well and produce fruit.',
        watering:
            'Pineapples are relatively drought-tolerant once established, but they still need consistent moisture during the growing season. Water the plant moderately, allowing the soil to dry out between waterings.',
      ),
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1625007507813-28644d7d8b03?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Papaya',
          subtitle: 'Year-round(Tropical)',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1694721308144-3b2182e6de10?q=80&w=1931&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Tropical Fruit Tree (herbaceous plant)',
          plantFamily: 'Caricaceae',
          plantOrigin:
              'Native to Southern Mexico and Central America, but now widely cultivated in tropical and subtropical regions worldwide.',
          lightRequirement:
              'Papaya plants require full sun to thrive and produce fruit. They need at least 6 to 8 hours of direct sunlight daily for optimal growth.',
          watering:
              'Papaya plants prefer consistently moist soil, but they don’t like to be waterlogged. Water the plant regularly, especially in dry periods, ensuring the soil remains moist but not soggy.'),
      Plant(
          imageUrl:
              'https://plus.unsplash.com/premium_photo-1661843593682-facc94cf9f33?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Cherry',
          subtitle: 'Spring',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1662559102063-a665b04771fd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Deciduous Fruit Tree',
          plantFamily: 'Rosaceae (Rose family)',
          plantOrigin:
              'Native to Europe and Asia, cherries have been cultivated for thousands of years for their sweet and tart fruit.',
          lightRequirement:
              'Cherries need full sun to grow and produce high-quality fruit. They require at least 6 hours of direct sunlight per day.',
          watering:
              'Cherries prefer moderate watering. They need consistent moisture, especially during the growing season, but they don’t like being waterlogged.'),
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1698648012253-9ca695b65ca3?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Peach',
          subtitle: 'Summer',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1659172562820-da73ec2a67dc?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Deciduous Fruit Tree',
          plantFamily: 'Rosaceae (Rose family)',
          plantOrigin:
              'Native to China, peaches have been cultivated for over 2,000 years and are now widely grown in temperate regions worldwide.',
          lightRequirement:
              'Peach trees require full sun to grow and produce high-quality fruit. They need at least 6 to 8 hours of direct sunlight per day.',
          watering:
              'Peach trees need deep, consistent watering to thrive. During the growing season, they prefer soil that is evenly moist but not soggy.'),
    ];

    List<Plant> listOfGrains = [
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1567547921486-f280c2f53b5d?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Corn',
          subtitle: 'Summer',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1551810080-3eb3be72d3f4?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Annual Cereal Crop',
          plantFamily: 'Poaceae (Grass family)',
          plantOrigin:
              'Native to Mesoamerica, particularly southern Mexico, where it was first domesticated around 10,000 years ago.',
          lightRequirement:
              'Corn plants need full sun to thrive. They require at least 6 to 8 hours of direct sunlight per day for optimal growth.',
          watering:
              'Corn requires consistent moisture, especially during its growing phase and while the ears are developing. Water regularly to keep the soil evenly moist—about 1–1.5 inches of water per week is ideal.'),
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1626639210401-ae46e2a9d299?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Oats',
          subtitle: 'Winter',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1626467688617-0ff45c3ab9c1?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Annual Cereal Crop',
          plantFamily: 'Poaceae (Grass family)',
          plantOrigin:
              'Native to Asia, oats were domesticated in Europe and have been grown for thousands of years, particularly in cool, temperate climates.',
          lightRequirement:
              'Oats grow best in full sun but can tolerate partial shade. They need about 4–6 hours of direct sunlight daily.',
          watering:
              'Oats require consistent moisture throughout their growing cycle, especially during the early stages of growth.'),
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1599576697248-b2aa466ef6e1?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Rice',
          subtitle: 'Summer and rainy season',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1659957821961-16ef89c40686?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Annual Cereal Crop',
          plantFamily: 'Poaceae (Grass family)',
          plantOrigin:
              'Native to Southeast Asia, rice has been cultivated for thousands of years and is a staple food for millions worldwide, especially in Asia.',
          lightRequirement:
              'Rice plants thrive in full sun and require at least 6 to 8 hours of direct sunlight daily. They need plenty of sunlight to grow tall and produce strong, healthy grains.',
          watering:
              'Rice plants are unique in that they require standing water during most of their growing period. Typically, they grow in flooded fields (called paddies), where the water level is maintained at around 2-4 inches above the soil.'),
      Plant(
          imageUrl:
              'https://images.unsplash.com/photo-1657573100558-c15355cc9c49?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Wheat',
          subtitle: 'Winter and spring',
          isFavorite: false,
          backgroundImageUrl:
              'https://images.unsplash.com/photo-1566679056469-16061a39232a?q=80&w=2075&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          plantType: 'Annual Cereal Crop',
          plantFamily: 'Poaceae (Grass family)',
          plantOrigin:
              'Native to Southwest Asia (modern-day Turkey, Syria, and Iraq), wheat has been cultivated for over 10,000 years and is one of the world’s most important staple crops.',
          lightRequirement:
              'Wheat grows best in full sun and needs about 6 to 8 hours of direct sunlight daily for optimal growth. Sunlight is essential for strong, healthy growth.',
          watering:
              'Wheat requires moderate watering. During the growing season, it needs consistent moisture, especially during the early growth and flowering stages.'),
    ];

    List<Plant> whichList() {
      if (isVegetables) {
        return listOfVegetables;
      } else if (isHerbs) {
        return listOfHerbs;
      } else if (isFruit) {
        return listOfFruits;
      } else if (isGrains) {
        return listOfGrains;
      }
      return listOfAllPlants;
    }

    void addToFavorite(Plant plant) {
      setState(() {
        if (!listOfFavoritePlants.contains(plant)) {
          listOfFavoritePlants.add(plant);
          plant.isFavorite = true;
        } else {
          listOfFavoritePlants.remove(plant);
          plant.isFavorite = false;
        }
      });
    }

    void onPressedView() {
      setState(() {
        isGridView = isGridView ? false : true;
      });
    }

    @override
    void initState() {
      super.initState();

      _animationController = AnimationController(
          vsync: this, duration: const Duration(milliseconds: 200));
      _backGroundColorAnimation =
          ColorTween(begin: Colors.white, end: Colors.black)
              .animate(_animationController);
      _contentColorAnimation =
          ColorTween(begin: Colors.black, end: Colors.white)
              .animate(_animationController);

      //_switchIconsAnimation = IconData(begin: Icons.light_mode, end: Icons.dark_mode).animate(_animationController);

      listOfAllPlants = [
        ...listOfHerbs,
        ...listOfFruits,
        ...listOfVegetables,
        ...listOfGrains
      ];
    }

    @override
    void dispose() {
      super.dispose();
      _animationController.dispose();
    }

    @override
    Widget build(BuildContext context) {
      var size = MediaQuery.sizeOf(context);
      var Size(:width, :height) = size;
      height = height - (kToolbarHeight + kTextTabBarHeight);

      listOfWidgetsForHorizontalListView = [
        CategoryButtons(
          text: 'All',
          onPressed: onPressedAll,
          backgroundColor:
              isAll ? const Color(0xff272A29) : const Color(0xffF2F4F5),
          foregroundColor: isAll ? Colors.white : Colors.black,
        ),
        CategoryButtons(
          text: 'Vegetables',
          onPressed: onPressedVegetables,
          backgroundColor:
              isVegetables ? const Color(0xff272A29) : const Color(0xffF2F4F5),
          foregroundColor: isVegetables ? Colors.white : Colors.black,
        ),
        CategoryButtons(
          text: 'Herbs',
          onPressed: onPressedHerbs,
          backgroundColor:
              isHerbs ? const Color(0xff272A29) : const Color(0xffF2F4F5),
          foregroundColor: isHerbs ? Colors.white : Colors.black,
        ),
        CategoryButtons(
          text: 'Fruits',
          onPressed: onPressedFruits,
          backgroundColor:
              isFruit ? const Color(0xff272A29) : const Color(0xffF2F4F5),
          foregroundColor: isFruit ? Colors.white : Colors.black,
        ),
        CategoryButtons(
          text: 'Grains',
          onPressed: onPressedGrains,
          backgroundColor:
              isGrains ? const Color(0xff272A29) : const Color(0xffF2F4F5),
          foregroundColor: isGrains ? Colors.white : Colors.black,
        ),
        CategoryButtons(
          text: 'Trees',
          onPressed: () {},
          backgroundColor: const Color(0xffF2F4F5),
          foregroundColor: Colors.black,
        ),
        CategoryButtons(
          text: 'Climbers',
          onPressed: () {},
          backgroundColor: const Color(0xffF2F4F5),
          foregroundColor: Colors.black,
        ),
        CategoryButtons(
          text: 'Creepers',
          onPressed: () {},
          backgroundColor: const Color(0xffF2F4F5),
          foregroundColor: Colors.black,
        ),
      ];

      return SafeArea(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return DefaultTabController(
              length: 2,
              child: Scaffold(
                backgroundColor: _backGroundColorAnimation.value,
                appBar: AppBar(
                  backgroundColor: _backGroundColorAnimation.value,
                  title: Text(
                    'Plant',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        fontFamily: 'Jost',
                        color: _contentColorAnimation.value),
                  ),
                  centerTitle: true,
                  actions: [
                    IconButton(
                        onPressed: onPressedView,
                        icon: Icon(isGridView ? Icons.list : Icons.grid_view))
                  ],
                  bottom: TabBar(
                      labelStyle: const TextStyle(
                          fontFamily: 'Jost',
                          fontSize: 22,
                          color: Colors.black),
                      labelColor: _contentColorAnimation.value,
                      unselectedLabelColor: _contentColorAnimation.value,
                      indicatorColor: const Color(0xff61C80E),
                      indicatorSize: TabBarIndicatorSize.tab,
                      overlayColor: WidgetStatePropertyAll(
                          _backGroundColorAnimation.value),
                      tabs: const [
                        Tab(text: 'General'),
                        Tab(text: 'Favorites'),
                      ]),
                ),
                body: TabBarView(children: [
                  Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            width: width,
                            height: height * 0.06,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: listOfWidgetsForHorizontalListView),
                          ),
                          SizedBox(
                            width: width,
                            height: height * 0.94,
                            child: PlantListView(
                              listOfPlants: whichList(),
                              contentColorAnimation: _contentColorAnimation,
                              onPressedFavorite: addToFavorite,
                              isGridView: isGridView,
                              backGroundColorAniamtion:
                                  _backGroundColorAnimation,
                              width: width,
                              height: height,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: SingleChildScrollView(
                        child: listOfFavoritePlants.isNotEmpty
                            ? SizedBox(
                                width: width,
                                height: height,
                                child: PlantListView(
                                  listOfPlants: listOfFavoritePlants,
                                  contentColorAnimation: _contentColorAnimation,
                                  onPressedFavorite: addToFavorite,
                                  isGridView: isGridView,
                                  backGroundColorAniamtion:
                                      _backGroundColorAnimation,
                                  height: height,
                                  width: width,
                                ),
                              )
                            : Text(
                                "No favorites yet! Add some ❤️",
                                style: TextStyle(
                                    color: _contentColorAnimation.value,
                                    fontFamily: 'Jost',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              )),
                  ),
                ]),
                drawer: Drawer(
                  backgroundColor: _backGroundColorAnimation.value,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 160,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/identifier.png'),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        height: height * 0.7,
                        child: Column(
                          children: [
                            Material(
                              color: _backGroundColorAnimation.value,
                              child: InkWell(
                                onTap: onPressedInfo,
                                mouseCursor: SystemMouseCursors.click,
                                child: ListTile(
                                  title: const Text(
                                    'About us',
                                  ),
                                  titleTextStyle: TextStyle(
                                      color: _contentColorAnimation.value,
                                      fontFamily: 'Jost',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                  subtitleTextStyle: TextStyle(
                                    color: _contentColorAnimation.value,
                                  ),
                                  trailing: const Icon(
                                    Icons.info,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: _backGroundColorAnimation.value,
                              child: InkWell(
                                onTap: onPressedDisplayMode,
                                mouseCursor: SystemMouseCursors.click,
                                child: ListTile(
                                  title: isLightMode
                                      ? const Text('Switch to dark mode')
                                      : const Text('Switch to light mode'),
                                  titleTextStyle: TextStyle(
                                      color: _contentColorAnimation.value,
                                      fontFamily: 'Jost',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                  subtitleTextStyle: TextStyle(
                                    color: _contentColorAnimation.value,
                                  ),
                                  trailing: isLightMode
                                      ? const Icon(
                                          Icons.light_mode,
                                          size: 15,
                                        )
                                      : const Icon(
                                          Icons.dark_mode,
                                          size: 15,
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          'All right reserved',
                          style: TextStyle(
                              color: _contentColorAnimation.value,
                              fontFamily: 'Jost',
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    }
  }
