import 'package:flutter/material.dart';
import 'package:travel_app/data/categories_data.dart';
import 'package:travel_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = "categories";

  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 7 / 8,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      children: categoriesData
          .map((item) => CategoryItem(
              itemTitle: item.title,
              itemImageUrl: item.imageUrl,
              itemId: item.id))
          .toList(),
    );
  }
}
