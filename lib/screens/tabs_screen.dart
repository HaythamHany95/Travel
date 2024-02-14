import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/screens/categories_screen.dart';
import 'package:travel_app/screens/favorites_screen.dart';
import 'package:travel_app/widgets/app_drawer.dart';

class TabsScreen extends StatefulWidget {
  static const String routeName = "tabsScreen";
  final List<Trip> favoritTrips;

  const TabsScreen({super.key, required this.favoritTrips});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  /// [ MARK ] Variables :-
  int _currentScreenIndex = 0;

  late List<Map<String, Object>> _screens;

  /// [ MARK ] Life Cycle :-
  @override
  void initState() {
    super.initState();
    _screens = [
      {
        "screen": const CategoriesScreen(),
        "title": "تصنيفات الرحلات",
      },
      {
        "screen": FavoritesScreen(
          favorits: widget.favoritTrips,
        ),
        "title": "الرحلات المفضلة",
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${_screens[_currentScreenIndex]['title']}",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      drawer: const AppDrawer(),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen // An alternative method
          //  (currentIndex) {
          //   _currentScreenIndex = currentIndex;
          //   setState(() {});
          // },
          ,
          currentIndex: _currentScreenIndex,
          backgroundColor: Colors.blue[600],
          selectedItemColor: Theme.of(context).secondaryHeaderColor,
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: "التصنيفات",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "المفضلة"),
          ]),
      body: _screens[_currentScreenIndex]['screen'] as Widget,
    );
  }

  /// [ MARK ] Utilities :-
  void _selectScreen(int screenIndex) {
    _currentScreenIndex = screenIndex;
    setState(() {});
  }
}


///* If we want to have that [NavigationTapBar] `above` the body widget
/// return DefaultTabController(
//   length: 2,
//   child: Scaffold(
//     appBar: AppBar(
//       title: const Text("دليل سياحي"),
//       bottom: TabBar(
//           labelColor: Colors.white,
//           indicatorColor: Theme.of(context).secondaryHeaderColor,
//           indicatorWeight: 3,
//           indicatorSize: TabBarIndicatorSize.tab,
//           tabs: [
//             Tab(
//               icon: const Icon(Icons.dashboard, color: Colors.white),
//               child: Text("التصنيفات",
//                   style: Theme.of(context).textTheme.headlineSmall),
//             ),
//             Tab(
//               icon: const Icon(Icons.star, color: Colors.white),
//               child: Text("المفضلة",
//                   style: Theme.of(context).textTheme.headlineSmall),
//             ),
//           ]),
//     ),
//     body: const TabBarView(
//       children: [CategoriesScreen(), FavoritesScreen()],
//     ),
//   ),
// );
