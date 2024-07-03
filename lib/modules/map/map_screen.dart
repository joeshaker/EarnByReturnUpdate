

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:latlong2/latlong.dart';
import '../../shared/component/component/components.dart';
import '../../shared/styles/colorsEarn.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'maps_sheets.dart';

class MapScreen extends StatelessWidget {
  MapScreen({super.key});

  late Future<Map<String, double>> currentLocatoin;
  final MapController mapController = MapController();
  @override
  Widget build(BuildContext context) {
    MapCubit.get(context).getCurrentLocation();
    MapCubit.get(context).getCurrentLocation();


    return BlocConsumer<MapCubit, Mapstates>(
      listener: (context, state) async {
        if(state is MapInitalstate){
          MapCubit.get(context).getCurrentLocation();
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        double currentLang = MapCubit.get(context).currentLang;
        double currentLat = MapCubit.get(context).currentLat;
        int distance = MapCubit.get(context).distance_current_machine;
        List machines = MapCubit.get(context).machines;
        List redeemers = MapCubit.get(context).redeemers;

        return Stack(
          children: [
            FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  initialCenter:
                  LatLng(machines[0]['lat'], machines[0]['lang']),
                  initialZoom: 17.2,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                    "https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1Ijoic29oaWxhYW1pciIsImEiOiJjbHYwOXhtcm8xanhnMmxtbzI1cHY3aDYwIn0.V_5TuBAQSpJki5YomQmVOA",
                    additionalOptions: {
                      'id': 'mapbox/streets-v11', // Style ID
                    },
                  ),
                  ConditionalBuilder(condition: MapCubit.get(context).nearestMachineSelected==true,

                    builder:  (context)=>MarkerLayer(
                      markers: List<Marker>.generate(machines.length, (index) {
                        return Marker(
                          point: LatLng(machines[index]['lat'], machines[index]['lang']),
                          width: 80,
                          height: 80,
                          child: Icon(
                            CupertinoIcons.location_solid,
                            color: Colors.green,
                          ),
                        );
                      }),
                    ),

                    fallback: (context)=>MarkerLayer(
                      markers: List<Marker>.generate(redeemers.length, (index) {
                        return Marker(
                          point: LatLng(redeemers[index]['lat'], redeemers[index]['lang']),
                          width: 80,
                          height: 80,
                          child: Icon(
                            CupertinoIcons.location_solid,
                            color: Colors.red,
                          ),
                        );
                      }),
                    ),),



                  LocationMarkerLayer(
                      style: LocationMarkerStyle(
                          marker: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.circle,
                                size: 20,
                                color: Colors.blue,
                              ))),
                      position: LocationMarkerPosition(
                        latitude: currentLat,
                        longitude: currentLang,
                        accuracy: 10,
                      )),
                ]),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 450.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            MapCubit.get(context)
                                .changeSelectedButton(type: 'machine');
                            print(
                                MapCubit.get(context).nearestMachineSelected);
                          },
                          child: Container(
                            height: 65,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: MapCubit.get(context)
                                    .nearestMachineSelected
                                    ? defaultColor
                                    : Colors.grey[400]),
                            child: Center(
                              child: Text(
                                "Nearest Machine",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    decoration: TextDecoration
                                        .none, // Remove underline
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ), //nearst machines

                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            MapCubit.get(context)
                                .changeSelectedButton(type: 'redeem');
                            print(
                                MapCubit.get(context).nearestMachineSelected);
                          },
                          child: Container(
                            height: 65,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: MapCubit.get(context)
                                    .nearestMachineSelected
                                    ? Colors.grey[400]
                                    : defaultColor),
                            child: Center(
                              child: Text(
                                "Nearest Redeemers",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    decoration: TextDecoration
                                        .none, // Remove underline
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ), //nearst redeemers
                    ],
                  ),
                ),
                ConditionalBuilder(
                    condition:
                    MapCubit.get(context).nearestMachineSelected == true,
                    builder: (context) => Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return
                            mapItem(
                              itemName: machines[index]['name'],
                              itemDistance: machines[index]['distance'],
                              context: context,
                              currentLat: currentLat,
                              currentLang: currentLang,
                              itmeLat: machines[index]['lat'],

                              itemLang: machines[index]['lang']);



                        },
                        itemCount: machines.length,
                        separatorBuilder:
                            (BuildContext context, int index) {
                          return SizedBox(
                            height: 15,
                          );
                        },
                      ),
                    ),
                    fallback: (context) => Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            height: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Padding(
                              padding: EdgeInsetsDirectional.symmetric(
                                  vertical: 20, horizontal: 15),
                              child: Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.end,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${redeemers[index]['name']}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors
                                              .black, // Set desired text color
                                          decoration: TextDecoration
                                              .none, // Remove underline
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "${redeemers[index]['distance']} km",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300,
                                          color: defaultColor,
                                          decoration: TextDecoration
                                              .none, // Remove underline
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 85,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            color: defaultColor),
                                        child: Center(
                                          child: Text(
                                            "27/7 Access",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 10,
                                              color: Colors.white,
                                              decoration:
                                              TextDecoration.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 100,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            color: defaultColor),
                                        child: Center(
                                          child: Text(
                                            "Public Access",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                              color: Colors.white,
                                              decoration: TextDecoration
                                                  .none, // Remove underline
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(

                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(70),
                                    ),
                                    child: ElevatedButton
                                      (
                                      style: ButtonStyle(


                                          backgroundColor: MaterialStateProperty.all<Color>(
                                              defaultColor // Replace 0xFF00FF00 with your hex color value
                                          ),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),

                                              )
                                          )
                                      ),



                                      onPressed: () {
                                        MapsSheet.show(
                                          context: context,
                                          onMapTap: (map) {
                                            map.showDirections(
                                              destination: Coords(
                                                redeemers[index]['lat'],
                                                redeemers[index]['lang'],
                                              ),
                                              destinationTitle:  redeemers[index]['name'],
                                              origin: Coords(currentLat, currentLang),
                                              originTitle: 'current location',


                                              directionsMode: DirectionsMode.driving,
                                            );
                                          },
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Icon(CupertinoIcons.location,
                                              color: Colors.white),
                                          SizedBox(width: 7,),
                                          Text('GO',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                  FontWeight.bold))
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: redeemers.length,
                        separatorBuilder:
                            (BuildContext context, int index) {
                          return SizedBox(
                            height: 15,
                          );
                        },
                      ),
                    )),

                // contain locatin name and details
              ],
            ),
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {
                  MapCubit.get(context).getCurrentLocation();
                  mapController.move(LatLng(currentLat, currentLang), 17);
                },
                child: Icon(
                    color: Colors.blue,
                    CupertinoIcons.location_circle),
              ),
            ),
          ],
        );
      },
    );
  }
}
