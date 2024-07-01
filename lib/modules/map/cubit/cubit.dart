import 'package:bloc/bloc.dart';

import 'package:earn_by_return/modules/map/cubit/states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class MapCubit extends Cubit<Mapstates> {
  MapCubit() : super(MapInitalstate());

  static MapCubit get(context) => BlocProvider.of(context);


  late double currentLang = 0;
  late double currentLat = 0;
  late double machineLang = 30.993975217222957;
  late double machineLat = 30.825872468646622;
  late int distance_current_machine = 0;
 late bool nearestMachineSelected =true;
 List redeemers=[
   {
     'name':'Mac',
     'lat':30.800612218124904,
     'lang':30.998193025589497,
     'access':'27/7',
     'distance':0
   },
   {
     'name':'Papa John\'s Pizza',
     'lat':30.799565894515435,
     'lang': 30.99777790914052,
     'access':'27/7',
     'distance':0
   },
   {
     'name':'KFC',
     'lat':30.845827173505796,
     'lang': 31.017828391095957,
     'access':'27/7',
     'distance':0
   },
   {

     'name':'Mac',
     'lat':30.791045865113446,
     'lang':30.998676130534438,
     'access':'27/7',
     'distance':0
   },

 ];
  List machines=[
    {
      'name':'Tanta university',
      'lang':30.99396250029059,
      'lat': 30.82587246587664,
      'access':'27/7',
      'distance':0
    },


  ];


  void getCurrentLocation() async {
    try {

      emit(MapGettingPermissionErrorstate());
      bool serviceEnabled;
      LocationPermission permission;


      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services.

        emit(MapErrorstate('Location services are disabled.',
            'Location services are disabled.'));
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

          emit(MapErrorstate('Location permissions are denied',
              'Location permissions are denied'));
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        emit(MapErrorstate(
            'Location permissions are permanently denied, we cannot request permissions.',
            'Location permissions are permanently denied, we cannot request permissions.'));
      }

      // When we reach here, permissions are granted and we can
      // continue accessing the position of the device.

      emit(MapGetCurrentLocationInitstate());
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      for( int i=0; i<redeemers.length;i++ ){

        int distance=    distance_current_machine = getDistance(
            destinationLat: redeemers[i]['lat'],
            destinationLang: redeemers[i]['lang']);

        redeemers[i]['distance']=distance;
      }

      for( int j=0; j<machines.length;j++ ){

        int distance=    distance_current_machine = getDistance(
            destinationLat: machines[j]['lat'],
            destinationLang: machines[j]['lang']);
        print('Distance to ${machines[j]['name']}: $distance'); // Debugging
        machines[j]['distance']=distance;
      }

      currentLat = position.latitude;
      currentLang = position.longitude;
      distance_current_machine = getDistance(
          destinationLat: 30.825872468646622,
          destinationLang: 30.993975217222957);

      emit(MapGetCurrentLocationstate());
    } catch (e) {
      emit(MapErrorstate(e.toString(), 'Error getting current location'));
      print("Error getting current location: $e");
    }
  }

  int getDistance({required destinationLat, required destinationLang}) {
    int distance = (Geolocator.distanceBetween(
                currentLat, currentLang, destinationLat, destinationLang) /
            1000)
        .round();
    emit(MapCalculateDistancestate());
    return distance;
  }

  void changeSelectedButton({required String type}) {
    if (type == 'machine') {
      nearestMachineSelected = true;
      emit(MapSelectedMachineButtonstate());
    }if (type == 'redeem') {

      nearestMachineSelected = false;
      emit(MapSelectedRedeemButtonstate());



    }
  }
}
