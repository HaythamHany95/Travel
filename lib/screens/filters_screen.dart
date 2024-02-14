import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = "filtersScreen";

  final Map currentFilters;
  final Function saveFilterChanges;

  const FiltersScreen(
      {required this.currentFilters,
      required this.saveFilterChanges,
      super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  /// [ MARK ] Variables:-
  bool _inSummer = false;
  bool _inWinter = false;
  bool _forFamily = false;

  /// [ MARK ] Life Cycle:-
  @override
  void initState() {
    super.initState();
    _inSummer = widget.currentFilters["summer"];
    _inWinter = widget.currentFilters["winter"];
    _forFamily = widget.currentFilters["family"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const AppDrawer(),
        appBar: AppBar(
          title: Text(
            "الفلترة",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: [
            IconButton(
              onPressed: () {
                final Map<String, bool> selectedFilters = {
                  "summer": _inSummer,
                  "winter": _inWinter,
                  "family": _forFamily
                };
                widget.saveFilterChanges(selectedFilters);
              },
              icon: const Icon(Icons.save_rounded),
            )
          ],
        ),
        body: Column(
          children: [
            const SizedBox(height: 50),
            buildSwitchListTile(
              title: "الرحلات الصيفية فقط",
              subtitle: "اظهار الرحلات في فصل الصيف فقط",
              value: _inSummer,
              onChanged: (newValue) {
                _inSummer = newValue;
                setState(() {});
              },
            ),
            buildSwitchListTile(
                title: "الرحلات الشتوية فقط",
                subtitle: "اظهار الرحلات في فصل الشتاء فقط",
                value: _inWinter,
                onChanged: (newValue) {
                  _inWinter = newValue;
                  setState(() {});
                }),
            buildSwitchListTile(
                title: "الرحلات العائلية فقط",
                subtitle: "اظهار الرحلات في العائلية فقط",
                value: _forFamily,
                onChanged: (newValue) {
                  _forFamily = newValue;
                  setState(() {});
                })
          ],
        ));
  }

  /// [ MARK ] Utilities:-
  Widget buildSwitchListTile(
      {required String title,
      required String subtitle,
      required,
      required bool value,
      void Function(bool)? onChanged}) {
    return SwitchListTile(
      activeTrackColor: Colors.amber,
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }
}
