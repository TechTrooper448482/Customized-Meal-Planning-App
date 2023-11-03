import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

/// FILEPATH: /c:/Users/manta/AndroidStudioProjects/meals_app/lib/screens/categories.dart
/// This class represents the stateful widget for the categories screen.
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override

  /// Called when this object is inserted into the tree.
  /// The framework will call this method exactly once for each [State] object it creates.

  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override

  /// Called when this object is removed from the tree permanently.
  /// The framework calls this method when this [State] object will never build again.
  /// Override this method to perform any cleanup your [State] object needs before it is removed from the tree.
  /// This method is called after [deactivate] and before [dispose].

  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// This method is called when a category is selected and it navigates to the corresponding meals screen.
  ///
  /// Parameters:
  /// - [context]: The build context of the widget.
  /// - [category]: The selected category.
  void _selectCategory(BuildContext context, Category category) {
    // implementation goes here

    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override

  /// This method builds the widget for the categories screen.
  /// It takes in a [BuildContext] and returns a [Widget].
  /// The [BuildContext] is used to build the widget tree.

  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectedCategory: () {
                _selectCategory(context, category);
              },
            ),
        ],
      ),
      builder: (context, child) {
        return SlideTransition(
            position: Tween(
              begin: const Offset(0, 0.3),
              end: const Offset(0, 0),
            ).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeInOut,
              ),
            ),
            child: child);
      },
    );
  }
}
