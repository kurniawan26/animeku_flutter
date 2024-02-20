import 'package:anime_ku/utils/navigation_item.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.navItems,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  final List<NavigationItem> navItems;
  final int selectedIndex;
  final void Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navItems.map((item) {
          var index = navItems.indexOf(item);
          return IconButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                index == selectedIndex
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface,
              ),
              iconSize: MaterialStateProperty.all(30),
            ),
            onPressed: () => onItemTapped(index),
            icon: Icon(
              item.icon,
            ),
          );
        }).toList(),
      ),
    );
  }
}
