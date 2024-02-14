///
/// This class is a custom widget for on card 'view' in gridview
///
import 'package:flutter/material.dart';
import 'package:travel_app/models/category.dart';
import 'package:travel_app/screens/categorytrips_screen.dart';

class CategoryItem extends StatelessWidget {
  final String? itemImageUrl;
  final String? itemTitle;
  final String? itemId;

  const CategoryItem(
      {this.itemId, this.itemTitle, this.itemImageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    /// Creating an object to pass it's data with `arguments` when navigate
    Category category =
        Category(id: "$itemId", title: "$itemTitle", imageUrl: "$itemImageUrl");
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(CategoryTripsScreen.routeName,
            arguments: category); // The Obj we created earlier
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              "$itemImageUrl",
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(14)),
            child: Text(
              "$itemTitle",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          )
        ],
      ),
    );
  }
}
