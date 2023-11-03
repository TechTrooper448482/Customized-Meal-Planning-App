import 'package:flutter/material.dart';

/// A widget that represents a trait of a meal item.
///
/// This widget is used to display a trait of a meal item, such as its affordability, complexity, or duration.
/// It takes in a [String] representing the trait name and an [IconData] representing the icon to display for the trait.
/// The trait name and icon are displayed in a row.
class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override

  /// Builds the widget tree for the meal item trait.
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.onBackground),
        const SizedBox(width: 6),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ],
    );
  }
}
