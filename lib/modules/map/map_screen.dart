import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';


import '../../shared/styles/colorsEarn.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(30.82571382281254, 30.99435384252314),
          initialZoom: 20.2,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1Ijoic29oaWxhYW1pciIsImEiOiJjbHYwOXhtcm8xanhnMmxtbzI1cHY3aDYwIn0.V_5TuBAQSpJki5YomQmVOA",
            additionalOptions: {
              'id': 'mapbox/streets-v11', // Style ID
            },
          ),

          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(30.82571382281254, 30.99435384252314),
                width: 80,
                height: 80,
                child: Icon(
                  CupertinoIcons.location_solid,
                  color: Colors.red,
                ),
              ),
            ],
          )
        ]);
  }
}



