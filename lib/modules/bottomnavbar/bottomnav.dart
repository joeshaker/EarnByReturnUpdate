import 'package:earn_by_return/modules/Homepage/Homescreen.dart';
import 'package:earn_by_return/modules/Qr/QrCode.dart';
import 'package:earn_by_return/modules/history/History.dart';
import 'package:earn_by_return/modules/mywallet_recycle/Mywallet.dart';
import 'package:flutter/material.dart';

import '../Redeem/Redeem.dart';
import '../map/map_screen.dart';
import '../profile/Profile.dart';
import '../qr_code/qrcode_screen.dart';

class Bottonav extends StatefulWidget {
  const Bottonav({super.key});

  @override
  State<Bottonav> createState() => _BottonavState();
}

class _BottonavState extends State<Bottonav> {
  @override
  int _selectedIndex = 0;
  List _pages = <Widget>[
    Homescreen(),
    MapScreen(),
    QRViewExample(),
    Redeemscreen(),
    ProflieScreen()
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // selectedFontSize: 20,
        // selectedIconTheme: IconThemeData(size: 40),
        // selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined,size: 30,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.green,
                child: Icon(Icons.qr_code_scanner_outlined,size: 30,color: Colors.white,)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard_outlined,size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_outlined,size: 30),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
    );
  }
}
