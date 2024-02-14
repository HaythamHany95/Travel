import 'package:flutter/material.dart';
import 'package:travel_app/data/trips_data.dart';

typedef OnPressedCallBack = void Function(String)?;

class TripDetailsScreen extends StatelessWidget {
  static const String routeName = "tripDetails";
  final OnPressedCallBack manageFavorites;
  final Function? isFavorite;

  const TripDetailsScreen({this.manageFavorites, this.isFavorite, super.key});

  @override
  Widget build(BuildContext context) {
    var tripId = ModalRoute.of(context)?.settings.arguments as String;
    // Creating an `TripObject` with the search below
    var selectedTrip = tripsData.firstWhere((item) => item.id == tripId);

    return Scaffold(
        appBar: AppBar(
          title: Text(selectedTrip.title,
              style: Theme.of(context).textTheme.titleMedium),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey[200],
          splashColor: Colors.red[200],
          shape: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50)),
          onPressed: () {
            manageFavorites!(tripId);
          },
          child: Icon(
            isFavorite!(tripId) ? Icons.star : Icons.star_border,
            color: Colors.red,
            size: 32,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                    selectedTrip.imageUrl,
                    fit: BoxFit.cover,
                  )),
              Container(
                alignment: Alignment.topRight,
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Text(
                  "الأنشطة",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(15)),
                height: 200,
                child: ListView.builder(
                  itemCount: selectedTrip.activities.length,
                  itemBuilder: (context, i) => Card(
                    elevation: 0.3,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        child: Text(
                          selectedTrip.activities[i],
                          style: Theme.of(context).textTheme.bodySmall,
                        )),
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text(
                    "البرنامج اليومي",
                    style: Theme.of(context).textTheme.headlineMedium,
                  )),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(15)),
                height: 200,
                child: ListView.builder(
                  itemCount: selectedTrip.program.length,
                  itemBuilder: ((context, i) => Column(children: [
                        ListTile(
                          leading: CircleAvatar(
                            radius: 23,
                            backgroundColor:
                                Theme.of(context).secondaryHeaderColor,
                            child: Text("يوم${i + 1}",
                                style: Theme.of(context).textTheme.bodyLarge),
                          ),
                          title: Text(
                            selectedTrip.program[i],
                            maxLines: 2,
                          ),
                        ),
                        const Divider(
                          thickness: 0.2,
                        )
                      ])),
                ),
              ),
              const SizedBox(
                height: 25,
              )
            ],
          ),
        ));
  }
}
