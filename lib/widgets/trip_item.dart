import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/screens/tripdetails_screen.dart';

class TripItem extends StatelessWidget {
  final String tripId;
  final String tripTitle;
  final String tripImageUrl;
  final int duration;
  final TripType tripType;
  final Season tripSeason;
  // final Function removeItem;

  const TripItem({
    super.key,
    required this.tripId,
    required this.tripTitle,
    required this.tripImageUrl,
    required this.duration,
    required this.tripType,
    required this.tripSeason,
    // required this.removeItem
  });

  ///[ MARK ]- Utilities:-

  /// To assign a `RawValue` to an enum
  /// by making getter variable of type that Value we need
  String get tripSeasonString {
    switch (tripSeason) {
      case Season.winter:
        return "شتاء";
      case Season.spring:
        return "ربيع";
      case Season.summer:
        return "صيف";
      case Season.autumn:
        return "خريف";
    }
  }

  IconData get tripSeasonIcon {
    switch (tripSeason) {
      case Season.winter:
        return (Icons.cloudy_snowing);
      case Season.spring:
        return (Icons.wb_sunny_outlined);
      case Season.summer:
        return (Icons.sunny);
      case Season.autumn:
        return (Icons.cloud);
    }
  }

  String get tripTypeString {
    switch (tripType) {
      case TripType.exploration:
        return "استكشاف";
      case TripType.recovery:
        return "نقاهة";
      case TripType.activities:
        return "نشاطات";
      case TripType.therapy:
        return "معالجة";
    }
  }

  IconData get tripTypeIcon {
    switch (tripType) {
      case TripType.exploration:
        return (Icons.snowboarding);
      case TripType.recovery:
        return (Icons.shower_outlined);
      case TripType.activities:
        return (Icons.accessibility_new_sharp);
      case TripType.therapy:
        return (Icons.airline_seat_flat_rounded);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(TripDetailsScreen.routeName, arguments: tripId)
            .then((result) {
          // if (result != null) {
          //   removeItem(result);
          // }
        });
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  child: Image.network(
                    tripImageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  width: double.infinity,
                  alignment: Alignment.bottomRight,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.6)
                    ],
                    // stops: const [0.6, 1],
                  )),
                  child: Text(
                    tripTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                    overflow: TextOverflow.fade,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.today_rounded,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        "$duration أيام",
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        tripSeasonIcon,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        tripSeasonString,
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        tripTypeIcon,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        tripTypeString,
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
