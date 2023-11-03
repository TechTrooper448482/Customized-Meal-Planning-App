import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';

/// An enum representing the available filters for meals.
enum Filter {
  /// Filter for gluten-free meals.
  glutenFree,

  /// Filter for lactose-free meals.
  lactoseFree,

  /// Filter for vegetarian meals.
  vegetarian,

  /// Filter for vegan meals.
  vegan,
}

/// A state notifier that manages a map of filters and their corresponding boolean values.
class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super(
            Filter.values.asMap().map((key, value) => MapEntry(value, false)));

  /// Sets the filters for the meals based on the provided map of filters.
  /// The keys of the map represent the filters and the values represent whether the filter is active or not.
  void setFilters(Map<Filter, bool> filters) {
    state = filters;
  }

  /// Toggles the [filter] on or off based on the [isActive] flag.
  void toggleFilter(Filter filter, bool isActive) {
    // implementation goes here

    state = {
      ...state,
      filter: isActive,
    };
  }
}

/// Provider for managing filters applied to meals.
/// FILEPATH: /C:/Users/manta/AndroidStudioProjects/meals_app/lib/providers/filters_provider.dart
final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);

/// Provider for filtered meals.
final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);
  return meals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
