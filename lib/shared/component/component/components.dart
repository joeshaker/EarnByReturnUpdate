import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:earn_by_return/shared/styles/colorsEarn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:map_launcher/map_launcher.dart';

import '../../../modules/map/maps_sheets.dart';

class TextModel{
  late String text1;
  late String text2;
  late String text3;
  late String text4;
  late Color firist;

  TextModel({required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.firist});
}

class ImageModel{
  late String text1;
  late String text2;
  late String img;

  ImageModel({required this.text1,
    required this.text2,
    required this.img});
}

class Details{
  late String text1;
  late String img;

  Details({required this.text1,
    required this.img});
}

class ProfileModel {
  final String text1;
  final IconData icon;
  final bool shouldNavigate;

  ProfileModel({
    required this.text1,
    required this.icon,
    required this.shouldNavigate,
  });
}

Widget buildGenderType({required bool ismale, required bool selected}) {
  return Container(
    decoration: BoxDecoration(
        color: selected ? Colors.blue : Colors.grey,
        borderRadius: BorderRadiusDirectional.circular(5)),
    height: 100,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
            color: Colors.white,
            size: 60,
            ismale ? Icons.male_outlined : Icons.female_outlined),
        Text(
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ismale ? 'Male' : 'Female'),
      ],
    ),
  );
}

Widget defaultTextForm({
  required TextEditingController controller,
  required String label,
  required String hintText,
  IconData? prefixicon,
  required TextInputType type,
  required void Function(String?) onSubmit,
  required String? Function(String? value) validate,
  required Function(String? value) onChange,
  bool isPassword = false,
  IconData? suffixicon,
  required Function() suffixPressed,
}) {
  return TextFormField(
    controller: controller,
    validator: validate,
    onChanged: onChange,
    obscureText: isPassword,
    keyboardType: type,
    onFieldSubmitted: onSubmit,
    decoration: InputDecoration(
      labelStyle: TextStyle(
        fontSize: 13
      ),
      //border: OutlineInputBorder(),
      labelText: label,
      hintText: hintText,
      prefixIcon: prefixicon != null
          ? Icon(
              prefixicon,
            )
          : null,
      suffixIcon: suffixicon != null
          ? IconButton(
              onPressed: suffixPressed,
              icon: Icon(
                suffixicon,
              ),
            )
          : null,
    ),
  );
}

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );
Widget defaultButton({

  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  bool? clickable=true ,
  required  Function() function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        hoverColor: !clickable!?background:null,
        splashColor: !clickable!?background:null,
        highlightColor: !clickable!?background:Colors.white,

        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );

Widget defaultTextButton({
  required Function() function,
  required String text,
  required Color color,
  required double fontSize,
  TextDecoration? decoration,
}) =>
    TextButton(

      onPressed: function,
      style: ButtonStyle(

        overlayColor: MaterialStateProperty.all(Colors.grey[100])
      ),
      child: Text(
        style: TextStyle(

          decoration: decoration,
          color: color,
          fontSize: fontSize
        ),
        text.toUpperCase(),
      ),
    );
void ShowToast({required String text, required ToastStates state}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: chooseToastColor(state: state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor({required ToastStates state}) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.yellow;
      break;
  }
  return color;
}
Widget elevatedButtonWithPic(
{
  required  String image,
  required  String text,

}
    )
{

  return  ElevatedButton(
      style: ButtonStyle(
          backgroundColor:MaterialStateProperty.all(Colors.white) ,
          elevation: MaterialStateProperty.all(5.0),
          fixedSize: MaterialStateProperty.all(Size(150, 45)),
          padding: MaterialStateProperty.all(
               EdgeInsets.all(7.0)),
          overlayColor: MaterialStateProperty.all(Colors.grey[100])
      ),
      onPressed: () {},
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(image),
            height: 25,
            fit: BoxFit.fill,
            width: 25,),
          SizedBox(
            width: 5,
          ),
          Text(
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal
              ),
              text)
        ],
      ));
}

class mapItems{
  late String name;
  late int distance;

  mapItems({required this.name,
    required this.distance});

}

Widget  mapItemm (
    {required String itemName,
      required int itemDistance,
      required BuildContext context,
      required double currentLat,
      required double currentLang,
      required double itmeLat,
      required double   itemLang,
    }
    ){

  return  Container(
    width: 170,
    margin: EdgeInsets.symmetric(horizontal: 10),
    height: 150,
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
                itemName,
                // '${machines[index]['name']}',
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
                "$itemDistance km",
                // "${machines[index]['distance']} km",
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
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius:
          //     BorderRadius.circular(20),
          //   ),
          //   child: ElevatedButton
          //     (
          //     style: ButtonStyle(
          //
          //
          //         backgroundColor: MaterialStateProperty.all<Color>(
          //             defaultColor // Replace 0xFF00FF00 with your hex
          //         ),
          //         shape:
          //         MaterialStateProperty.all<RoundedRectangleBorder>(
          //             RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(8),
          //
          //             )
          //         )
          //     ),
          //
          //
          //     onPressed: () {
          //       MapsSheet.show(
          //         context: context,
          //         onMapTap: (map) {
          //           map.showDirections(
          //             destination: Coords(
          //               // machines[index]['lat'],
          //                 itmeLat,
          //                 itemLang
          //               // machines[index]['lang'],
          //             ),
          //             destinationTitle:itemName,
          //             origin: Coords(currentLat, currentLang),
          //             originTitle: 'current location',
          //
          //
          //             directionsMode: DirectionsMode.driving,
          //           );
          //         },
          //       );
          //     },
          //
          //     child: Row(
          //       children: [
          //         Icon(CupertinoIcons.location,
          //             color: Colors.white),
          //         SizedBox(width: 7,),
          //         Text('GO',
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontWeight:
          //                 FontWeight.bold))
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    ),
  )

  ;



}

Widget  mapItem (
    {required String itemName,
      required int itemDistance,
      required BuildContext context,
      required double currentLat,
      required double currentLang,
      required double itmeLat,
      required double   itemLang,
    }
    ){

  return  Container(
    margin: EdgeInsets.symmetric(horizontal: 30),
    height: 150,
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
                itemName,
                // '${machines[index]['name']}',
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
                "$itemDistance km",
                // "${machines[index]['distance']} km",
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
              BorderRadius.circular(20),
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
                        // machines[index]['lat'],
                          itmeLat,
                          itemLang
                        // machines[index]['lang'],
                      ),
                      destinationTitle:itemName,
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
  )

  ;



}