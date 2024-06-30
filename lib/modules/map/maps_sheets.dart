import 'package:flutter/material.dart';

import 'package:map_launcher/map_launcher.dart';

class MapsSheet {
  static void show({
    required BuildContext context,
    required void Function(AvailableMap map) onMapTap,
  }) async {
    final availableMaps = await MapLauncher.installedMaps;

    if (!context.mounted) return;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    children: <Widget>[
                      for (var map in availableMaps)
                        ListTile(
                          onTap: () => onMapTap(map),
                          title: Text(map.mapName),
                          leading: Image(
                            height: 40,
                            width: 40,
                            image:AssetImage('assets/images/gps.jpg'),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}