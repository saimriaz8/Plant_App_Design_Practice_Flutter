import 'package:flutter/material.dart';
import 'package:plant_screen_design_flutter/category_buttons.dart';
import 'package:plant_screen_design_flutter/plant_list_view.dart';
import 'package:plant_screen_design_flutter/plant_model_class.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

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
        isFavorite: false),
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1707971892483-707b0360f963?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Spinach',
        subtitle: 'Winter and fall',
        isFavorite: false),
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1609161307645-3ad8d7cafb55?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Potato',
        subtitle: 'Fall and winter',
        isFavorite: false),
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1595755973454-6f57c3ece624?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Lettuce',
        subtitle: 'Winter and spring',
        isFavorite: false),
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1602496875335-b0fc93069cf9?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Carrot',
        subtitle: 'Winter and fall',
        isFavorite: false),
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1697345208214-7deed24fb445?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Cabbage',
        subtitle: 'Winter and fall',
        isFavorite: false),
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1604488943825-f95dc6796ca5?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Bell Pepper',
        subtitle: 'Summer and spring',
        isFavorite: false),
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1564894809611-1742fc40ed80?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Beans',
        subtitle: 'Spring and summer',
        isFavorite: false),
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1515589654462-a9881e276b84?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Pumpkin',
        subtitle: 'Summer and fall',
        isFavorite: false),
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1568584711075-3d021a7c3ca3?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Cauliflower',
        subtitle: 'Spring and summer',
        isFavorite: false),
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1545165311-508ed0c91361?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Radish',
        subtitle: 'Fall and winter',
        isFavorite: false),
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1706678200160-f0ecbcd1b3eb?q=80&w=2020&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Onion',
        subtitle: 'Fall and winter',
        isFavorite: false),
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1598030413471-23097f7a81be?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Eggplant',
        subtitle: 'Summer and spring',
        isFavorite: false),
  ];

  List<Plant> listOfHerbs = [
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1522259629856-5cd0267d12ac?q=80&w=1930&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Basil',
        subtitle: 'Summer and spring',
        isFavorite: false),
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1582556135623-653b87486f21?q=80&w=2006&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Mint',
        subtitle: 'Spring and summer',
        isFavorite: false),
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1679061584104-534b7ec4afe6?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Thyme',
        subtitle: 'Spring and summer',
        isFavorite: false),
  ];
  List<Plant> listOfFruits = [
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1600973385278-731983908fdd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Apple',
        subtitle: 'Winter and fall',
        isFavorite: false),
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1552901633-210088e17486?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Banana',
        subtitle: 'Year-round(Tropical)',
        isFavorite: false),
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1515778767554-42d4b373f2b3?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Grapes',
        subtitle: 'Summer and fall',
        isFavorite: false),
    Plant(
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1666299434471-1815114cdccc?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Kiwi',
        subtitle: 'Fall and winter',
        isFavorite: false),
    Plant(
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1675188201885-224646e3bcac?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Orange',
        subtitle: 'Fall and winter',
        isFavorite: false),
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1659172562836-ab7e46677822?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Plum',
        subtitle: 'Summer',
        isFavorite: false),
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1706059924399-1e26828a627f?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Pineapple',
        subtitle: 'Summer',
        isFavorite: false),
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1625007507813-28644d7d8b03?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Papaya',
        subtitle: 'Year-round(Tropical)',
        isFavorite: false),
    Plant(
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1661843593682-facc94cf9f33?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Cherry',
        subtitle: 'Spring',
        isFavorite: false),
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1698648012253-9ca695b65ca3?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Peach',
        subtitle: 'Summer',
        isFavorite: false),
  ];

  List<Plant> listOfGrains = [
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1567547921486-f280c2f53b5d?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Corn',
        subtitle: 'Summer',
        isFavorite: false),
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1626639210401-ae46e2a9d299?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Oats',
        subtitle: 'Winter',
        isFavorite: false),
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1599576697248-b2aa466ef6e1?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Rice',
        subtitle: 'Summer and rainy season',
        isFavorite: false),
    Plant(
        imageUrl:
            'https://images.unsplash.com/photo-1657573100558-c15355cc9c49?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        title: 'Wheat',
        subtitle: 'Winter and spring',
        isFavorite: false),
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

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _backGroundColorAnimation =
        ColorTween(begin: Colors.white, end: Colors.black)
            .animate(_animationController);
    _contentColorAnimation = ColorTween(begin: Colors.black, end: Colors.white)
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

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
              backgroundColor: _backGroundColorAnimation.value,
              appBar: AppBar(
                backgroundColor: _backGroundColorAnimation.value,
                leading: IconButton(
                  onPressed: onPressedInfo,
                  icon: const Icon(
                    Icons.info,
                    color: Color(0xff9B9B9B),
                  ),
                ),
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
                    onPressed: onPressedDisplayMode,
                    icon: Icon(
                      isLightMode ? Icons.light_mode : Icons.dark_mode,
                      color: Colors.grey,
                    ),
                  )
                ],
                bottom: TabBar(
                    labelStyle: const TextStyle(
                        fontFamily: 'Jost', fontSize: 22, color: Colors.black),
                    labelColor: _contentColorAnimation.value,
                    unselectedLabelColor: _contentColorAnimation.value,
                    indicatorColor: const Color(0xff61C80E),
                    indicatorSize: TabBarIndicatorSize.tab,
                    overlayColor:
                        WidgetStatePropertyAll(_backGroundColorAnimation.value),
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
              ])),
        );
      },
    );
  }
}
