import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:map_launcher/map_launcher.dart';

import 'maps_sheets.dart';



class ShowMarker extends StatefulWidget {
  const ShowMarker({super.key});

  @override
  State<ShowMarker> createState() => _ShowMarkerState();
}

class _ShowMarkerState extends State<ShowMarker> {

  double latitude = 37.759392;
  double longitude = -122.5107336;
  String title = "Ocean Beach";
  double startlatitude = 37.859392;
  double startlongitude = -122.7107336;
  int zoom = 18;
  late double distanceInMeters=0;
  void calculateDistance() {
    distanceInMeters = Geolocator.distanceBetween(latitude, longitude, startlatitude, startlongitude);
    print(distanceInMeters);
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            autocorrect: false,
            autovalidateMode: AutovalidateMode.disabled,
            decoration: const InputDecoration(labelText: 'Latitude'),
            initialValue: latitude.toString(),
            onChanged: (newValue) {
              setState(() {
                latitude = double.tryParse(newValue) ?? 0;
              });
            },
          ),
          TextFormField(
            autocorrect: false,
            autovalidateMode: AutovalidateMode.disabled,
            decoration: const InputDecoration(labelText: 'Longitude'),
            initialValue: longitude.toString(),
            onChanged: (newValue) {
              setState(() {
                longitude = double.tryParse(newValue) ?? 0;
              });
            },
          ),
          TextFormField(
            autocorrect: false,
            autovalidateMode: AutovalidateMode.disabled,
            decoration: const InputDecoration(labelText: 'Title'),
            initialValue: title,
            onChanged: (newValue) {
              setState(() {
                title = newValue;
              });
            },
          ),
          TextFormField(
            autocorrect: false,
            autovalidateMode: AutovalidateMode.disabled,
            decoration: const InputDecoration(labelText: 'Zoom'),
            initialValue: zoom.toString(),
            onChanged: (newValue) {
              setState(() {
                zoom = int.tryParse(newValue) ?? 0;
              });
            },
          ),
          const SizedBox(height: 20),
          Text("$distanceInMeters"),
          MaterialButton(
            onPressed: () {

              setState(() {
                calculateDistance();
              });

            },
            child: const Text('Show distance'),
          ),
          MaterialButton(
            onPressed: () {
              MapsSheet.show(
                context: context,
                onMapTap: (map) {
                  map.showMarker(
                    coords: Coords(latitude, longitude),
                    title: title,
                    zoom: zoom,
                  );
                },
              );
            },
            child: const Text('Show Maps'),
          )
        ],
      ),
    );
  }
}