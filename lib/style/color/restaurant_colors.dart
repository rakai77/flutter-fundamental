import 'package:flutter/material.dart';

enum RestaurantColors {
  yellow("Yellow", Colors.yellow);

  const RestaurantColors(this.name, this.color);

  final String name;
  final Color color;
}