import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart), label: 'Sales'),
        BottomNavigationBarItem(icon: Icon(Icons.inventory), label: 'Inventory'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Customers'),
      ],
      onTap: (index) {},
    );
  }
}
