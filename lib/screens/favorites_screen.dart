import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/widgets/trip_item.dart';

class FavoritesScreen extends StatelessWidget {
  static const String routeName = "favoritesScreen";

  final List<Trip> favorits;
  const FavoritesScreen({super.key, required this.favorits});

  @override
  Widget build(BuildContext context) {
    if (favorits.isEmpty) {
      return const Center(
        child: Text("ليس لديك أي رحلات مفضلة"),
      );
    } else {
      return ListView.builder(
          itemCount: favorits.length,
          itemBuilder: (context, i) => TripItem(
              tripId: favorits[i].id,
              tripTitle: favorits[i].title,
              tripImageUrl: favorits[i].imageUrl,
              duration: favorits[i].duration,
              tripType: favorits[i].tripType,
              tripSeason: favorits[i].season));
    }
  }
}
