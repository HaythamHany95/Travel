// ignore_for_file: prefer_final_fields
import 'package:flutter/material.dart';
import 'package:travel_app/data/trips_data.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/screens/categories_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travel_app/screens/categorytrips_screen.dart';
import 'package:travel_app/screens/favorites_screen.dart';
import 'package:travel_app/screens/filters_screen.dart';
import 'package:travel_app/screens/tabs_screen.dart';
import 'package:travel_app/screens/tripdetails_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// [ MARK ] Vatiables:
  Map<String, bool> _filters = {
    "summer": false,
    "winter": false,
    "family": false
  };

  List<Trip> _availableTrips = tripsData;
  List<Trip> _favoritTrips = [];

  void _changeFilters(Map<String, bool> filtersData) {
    _filters = filtersData;
    _availableTrips = tripsData.where((trip) {
      if (_filters["summer"] == true && trip.isInSummer != true) {
        return false;
      }
      if (_filters["winter"] == true && trip.isInWinter != true) {
        return false;
      }
      if (_filters["family"] == true && trip.isForFamilies != true) {
        return false;
      }

      return true;
    }).toList();
    setState(() {});
  }

  /// [ MARK ] Stf LifeCycle:
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'), // English
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.blue,
          secondaryHeaderColor: Colors.amber,
          fontFamily: 'ElMessiri',
          textTheme: ThemeData.light().textTheme.copyWith(
              headlineSmall: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold),
              headlineMedium: const TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold),
              bodySmall: const TextStyle(
                  fontSize: 15,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold),
              bodyLarge: const TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold),
              titleLarge: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold),
              titleMedium: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold)),
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              color: Colors.blue,
              foregroundColor: Colors.white)),
      initialRoute: TabsScreen.routeName,
      routes: {
        TabsScreen.routeName: (context) =>
            TabsScreen(favoritTrips: _favoritTrips),
        FavoritesScreen.routeName: (context) => FavoritesScreen(
              favorits: _favoritTrips,
            ),
        CategoriesScreen.routeName: (context) => const CategoriesScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(
              currentFilters: _filters,
              saveFilterChanges: _changeFilters,
            ),
        CategoryTripsScreen.routeName: (context) =>
            CategoryTripsScreen(availableTrips: _availableTrips),
        TripDetailsScreen.routeName: (context) => TripDetailsScreen(
            manageFavorites: _manageFavorites, isFavorite: _isFavorite)
      },
    );
  }

  /// [ MARK ] Utilites:
  void _manageFavorites(String tripId) {
    final int existingIndex =
        _favoritTrips.indexWhere((trip) => trip.id == tripId);
    if (existingIndex >= 0) {
      /// Means that we got an element `trip` in the list ,
      /// So we must remove it from the list
      _favoritTrips.removeAt(existingIndex);
      setState(() {});
    } else {
      /// Means that we got no element `trip` in the list ,
      /// So we must add it too the list
      _favoritTrips.add(tripsData.firstWhere((trip) => trip.id == tripId));
      setState(() {});
    }
  }

  /// Making this function to know if the trip is favorite or not to make an icon that fits the case
  bool _isFavorite(String tripId) {
    return _favoritTrips.any((trip) => trip.id == tripId);
  }
}
