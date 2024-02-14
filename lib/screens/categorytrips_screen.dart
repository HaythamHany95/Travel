import 'package:flutter/material.dart';
import 'package:travel_app/models/category.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/widgets/trip_item.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const String routeName = "categoryTrips";

  final List<Trip> availableTrips;

  const CategoryTripsScreen({super.key, required this.availableTrips});

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  ///
  ///[ MARK ]- Variables:-
  String? categoryId;
  String? categoryTitle;
  late List<Trip> displayedTrips;

  ///[ MARK ]- Wiget LifeCycle:-
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var category = ModalRoute.of(context)!.settings.arguments as Category;
    categoryId = category.id;
    categoryTitle = category.title;
    displayedTrips = widget.availableTrips
        .where((item) => item.categories.contains(categoryId))
        .toList();
  }

  ///[ MARK ]- Utilities:-
  // void _removeTrip(String tripId) {
  //   displayedTrips.removeWhere((item) => item.id == tripId);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    /// Passing data `CategoryObject` by navigatinig with arguments

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "$categoryTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, i) => TripItem(
            tripId: displayedTrips[i].id,
            tripTitle: displayedTrips[i].title,
            tripImageUrl: displayedTrips[i].imageUrl,
            duration: displayedTrips[i].duration,
            tripType: displayedTrips[i].tripType,
            tripSeason: displayedTrips[i].season,
            // removeItem: _removeTrip,
          ),
          itemCount: displayedTrips.length,
        ));
  }
}
