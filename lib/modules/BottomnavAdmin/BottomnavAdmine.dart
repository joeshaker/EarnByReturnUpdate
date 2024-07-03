import 'package:earn_by_return/modules/Admin/All%20transactions/TransactionAll.dart';
import 'package:earn_by_return/modules/dashboard/dashboard_screen.dart';
import 'package:earn_by_return/modules/profile/Profile.dart';
import 'package:flutter/material.dart';

class BottomNavAdmin extends StatefulWidget {
  const BottomNavAdmin({super.key});

  @override
  State<BottomNavAdmin> createState() => _BottomNavAdminState();
}

class _BottomNavAdminState extends State<BottomNavAdmin> {
  @override
  int _selectedIndex = 0;
  List _pages = <Widget>[
    DashboardScreen(),
    All_transaction(),
    ProflieScreen(),
  ];
  Widget build(BuildContext context) {
    return
      Scaffold(
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
              icon: Icon(Icons.account_balance_wallet_outlined,size: 30,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_outlined,size: 30,),
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
