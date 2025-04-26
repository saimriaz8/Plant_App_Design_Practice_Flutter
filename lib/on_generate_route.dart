import 'package:flutter/cupertino.dart';
import 'package:plant_screen_design_flutter/error_page.dart';
import 'package:plant_screen_design_flutter/main.dart';
import 'package:plant_screen_design_flutter/plant_detailed_page.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  if (MyHomePage.pageName == settings.name) {
    return CupertinoPageRoute(
        builder: (context) => const MyHomePage(
              title: 'Home Page',
            ),
        settings: settings);
  } else if (PlantDetailedPage.pageName == settings.name) {
    return CupertinoPageRoute(
        builder: (context) => const PlantDetailedPage(), settings: settings,);
  } else {
    return CupertinoPageRoute(builder: (context) => const ErrorPage(), settings: settings);
  }
}
