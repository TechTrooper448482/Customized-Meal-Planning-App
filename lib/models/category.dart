import 'package:flutter/material.dart';

/// A class representing a category of meals.
/// Each category has a title and an optional ID.
/// The ID is used to identify the category in the app.
class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });
}
