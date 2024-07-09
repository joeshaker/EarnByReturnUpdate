import 'package:earn_by_return/modules/bottomnavbar/bottomnav.dart';
import 'package:earn_by_return/modules/map/map_screen.dart';
import 'package:flutter/material.dart';

import '../../shared/component/component/components.dart';

class NoCoinsScreen extends StatefulWidget {
  const NoCoinsScreen({super.key});

  @override
  State<NoCoinsScreen> createState() => _NoCoinsScreenState();
}

class _NoCoinsScreenState extends State<NoCoinsScreen> {
  List<CongTexts>Texts2 = [
    CongTexts(text1: 'Sorry ! '),
    CongTexts(text1: 'You don’t have enough coins,'),
    CongTexts(text1: 'please collect more empty bottles and'),
    CongTexts(text1: 'cans to get more coins.'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0,right: 260),
            child: InkWell(
              onTap: (){
                navigateTo(context, Bottonav());
              },
              child:
              Icon(Icons.clear, color: Colors.black,size: 30,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: Center(
              child: Container(
                width: 293,
                height: 270,
                child: Image.asset('assets/images/img_6.png'),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            width: double.infinity,
            height: 120,
            child: ListView.builder(
              shrinkWrap: false,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>
                  Center(
                    child: buildText(Texts2[index]),
                  ),
              itemCount: Texts2.length,
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              navigateTo(context, MapScreen());
            },
            child: Center(
              child: Container(
                width: 276,
                height: 62,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green
                ),
                child: Center(
                  child: Text('Find nearest machine', style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    color: Colors.white
                  ),),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget buildText(CongTexts t) {
  return Text('${t.text1}', style:
  TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w700,
      color: Colors.grey
  ),);
}

