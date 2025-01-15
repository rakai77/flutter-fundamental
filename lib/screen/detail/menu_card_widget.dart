import 'package:flutter/material.dart';

class MenuCardWidget extends StatelessWidget {
  final String menu;

  const MenuCardWidget({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.yellow.shade800,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 4, // Minimal padding for a snug fit
        horizontal: 12,
      ),
      child: Text(
        menu,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.yellow.shade800,
        ),

      ),
    );
  }
}



