import 'package:flutter/material.dart';
import 'package:travel_app/screens/filters_screen.dart';
import 'package:travel_app/screens/tabs_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Widget buildListTile(
      {IconData? icon,
      String? title,
      String? routeName,
      void Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      tileColor: Colors.black.withOpacity(0.02),
      leading: Icon(
        icon,
        color: Colors.amber,
      ),
      title: Text("$title"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.blue,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 35),
            child: Text(
              "دليلك السياحي",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile(
            icon: Icons.card_travel_rounded,
            title: "الرحلات",
            onTap: () {
              Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
            },
          ),
          const Divider(
            thickness: 0.2,
          ),
          buildListTile(
            icon: Icons.filter_list,
            title: "الفلتره",
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
