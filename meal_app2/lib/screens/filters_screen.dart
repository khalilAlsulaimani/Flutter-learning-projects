import 'package:flutter/material.dart';
import 'package:meal_app2/widgets/main_drawer.dart';
import 'package:provider/provider.dart';

import '../provider/meal_provider.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  SwitchListTile buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, bool> currentFilters =
        Provider.of<MealProvider>(context, listen: true).filters;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust Your Meal Selection",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  "Gluten-free",
                  "include only gluten-free meals.",
                  currentFilters['gluten'],
                  (newValue) {
                    setState(() {
                      currentFilters['gluten'] = newValue;
                      Provider.of<MealProvider>(context, listen: false)
                          .setFilters();
                    });
                  },
                ),
                buildSwitchListTile(
                  "Lactose-free",
                  "include only Lactose-free meals.",
                  currentFilters['lactose'],
                  (newValue) {
                    setState(() {
                      currentFilters['lactose'] = newValue;
                      Provider.of<MealProvider>(context, listen: false)
                          .setFilters();
                    });
                  },
                ),
                buildSwitchListTile(
                  "Vegetarian",
                  "include only Vegetarian meals.",
                  currentFilters['vegetarian'],
                  (newValue) {
                    setState(() {
                      currentFilters['vegetarian'] = newValue;
                      Provider.of<MealProvider>(context, listen: false)
                          .setFilters();
                    });
                  },
                ),
                buildSwitchListTile(
                  "Vegen",
                  "include only Vegen meals.",
                  currentFilters['vegen'],
                  (newValue) {
                    setState(() {
                      currentFilters['vegen'] = newValue;
                      Provider.of<MealProvider>(context, listen: false)
                          .setFilters();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: const MainDrawer(),
    );
  }
}
