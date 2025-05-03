import 'package:flutter/material.dart';

class CategoryNavigation extends StatelessWidget {
  final List<Map<String, dynamic>> categories;
  final Function(String categoryId) onCategorySelected;

  const CategoryNavigation({
    Key? key,
    required this.categories,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(12.0),
      itemCount: categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];
        return GestureDetector(
          onTap: () => onCategorySelected(category['id']),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(category['icon'], size: 40, color: Colors.blueAccent),
                const SizedBox(height: 8),
                Text(
                  category['name'],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
