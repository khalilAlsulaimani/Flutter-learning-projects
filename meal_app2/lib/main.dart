import 'package:flutter/material.dart';
import 'package:meal_app2/provider/meal_provider.dart';
import 'package:meal_app2/screens/filters_screen.dart';
import 'package:provider/provider.dart';

import '../screens/category_meals_screen.dart';
import '../screens/meal_detail_screen.dart';
import '../screens/tabs_screen.dart';

void main() {
  runApp(ChangeNotifierProvider<MealProvider>(
    create: (ctx) => MealProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        cardColor: const Color.fromRGBO(35, 34, 39, 1),
        shadowColor: Colors.white60,
        buttonColor: Colors.white,
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'),
          bodySmall: TextStyle(
            fontFamily: 'Schyler',
            fontSize: 30,
          ),
        ),
      ),
      //home: const MyHomePage(),
      home: TabsScreen(),
      routes: {
        '/home': (context) => TabsScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal App"),
      ),
      body: null,
    );
  }
}
