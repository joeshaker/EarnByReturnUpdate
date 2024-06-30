import 'package:flutter/material.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Text("Hello",style: TextStyle(
        fontFamily: 'poppins',
        fontSize: 50,
        fontWeight: FontWeight.bold
      ),),
    );
  }
}
