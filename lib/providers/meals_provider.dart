import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:meals_app/data/dummy_data.dart";

/// A provider that creates a list of dummy meals.
final mealsProvider = Provider((ref) => dummyMeals);
