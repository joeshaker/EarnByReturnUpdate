import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:earn_by_return/modules/dashboard/cubit/cubit.dart';
import 'package:earn_by_return/modules/dashboard/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/styles/colorsEarn.dart'; // Replace with your actual import path

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

class DashboardScreen extends StatelessWidget {
  final List<String> list = <String>[
    'Last 7 days',
    'Last 1 month',
    'Last 3 months',
    'Last 6 months'
  ];
  final List<ChartData> chartData = [
    ChartData('David', 25),
    ChartData('Steve', 38),
    ChartData('Jack', 34),
    ChartData('Others', 52)
  ];
  final double width = 7;
  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  Widget indicatorCircle({
    required String text,
    required Color color,
    required double factorWidth,
    required double factorHeight,

  }) {
    return Row(
      children: <Widget>[
        Container(
          width: 6 *factorWidth,
          height: 6 *factorHeight,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        chartitemText(text: text)
      ],
    );
  }

  String dropdownValue = 'Last 7 days';

  DashboardScreen({Key? key}) : super(key: key);

  Widget capacityItem({
    required String image,
    required String title,
    required double factorWidth,
    required double factorHeight,
  }) {
    return Column(

      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
          height: 120 *factorHeight ,
          width: 60 *factorWidth,
        ),
        SizedBox(height: 13 *factorHeight) ,
        Text(
          title,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget itemBoldText({required String text}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget itemTitleText({required String text}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 15,
        color: HexColor("#9B9B9B"),
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget chartitemText({required String text}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12.5,
        color: HexColor("#9B9B9B"),
        fontWeight: FontWeight.w400,
      ),
    );
  }
  Widget itemSquare({
    required String heading,
    required String title,
    required String image,
    required String profit,

    required double factorWidth,
    required double factorHeight,




  }){
    return  Container(
      padding:
      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: 185 * factorWidth,
      height:  140*factorHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green),
        color: HexColor("#F1F1F1"),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.35),
            spreadRadius: 3,
            blurRadius: 3,

          ),
        ],
      ),
      child: Column(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "$image",
                width: 40 * factorWidth,
                fit: BoxFit.cover,
                height: 40 * factorHeight,
              ),
              Container(
                width: 47 * factorWidth,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "$profit",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),

          itemBoldText(text: heading),

          itemTitleText(text: title),
        ],
      ),
    );
}

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double factorWidth = width / 430;
    double factorHeight = height / 932;
   bool loading =true;

    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocConsumer<DashboardCubit, Dashboardstates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is DashboardInitalstate) {
            DashboardCubit.get(context).createGroupData();
            showingBarGroups = DashboardCubit.get(context).showingBarGroups;
          }
          if (state is DashboardDataCreatedstate) {
            loading = false;
            // Assign showingBarGroups after data is created
            showingBarGroups = DashboardCubit.get(context).showingBarGroups;
          }
          // 4""
          // Check if showingBarGroups is null (not initialized yet)
          if (showingBarGroups == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }



          return Scaffold(
            body: loading ? CircularProgressIndicator():

            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      child: DropdownButtonFormField<String>(
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        value: dropdownValue,
                        onChanged: (String? newValue) {
                          // This is called when the user selects an item.
                          if (newValue != null) {
                            dropdownValue = newValue;
                          }
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        dropdownColor: Colors.white,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ), // Dropdown menu
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 285 * factorHeight,
                          padding: EdgeInsets.all(10),
                          width: 194 * factorWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.green),
                            color: HexColor("#F1F1F1"),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.35),
                                spreadRadius: 3,
                                blurRadius: 3,

                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              itemBoldText(text: "Bin Capacity"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  capacityItem(
                                    factorHeight: factorHeight,
                                    factorWidth: factorWidth,
                                    image: 'assets/images/cansCapcity.png',
                                    title: "cans",
                                  ),
                                  SizedBox(width: 15),
                                  capacityItem(
                                    factorHeight: factorHeight,
                                    factorWidth: factorWidth,
                                    image: 'assets/images/bottleCapcity.png',
                                    title: "bottles",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Column(
                          children: [

                           itemSquare(
                               heading: "12.983.21",
                               title: "profit",
                               profit: "+30%",
                               image: "assets/images/img.png",
                               factorWidth: factorWidth,
                               factorHeight: factorHeight),
                            // Profit
                            SizedBox(height: 5),
                            itemSquare(
                                heading: "12.983.21",
                                title: "profit",
                                profit: "+30%",
                                image: "assets/images/img.png",
                                factorWidth: factorWidth,
                                factorHeight: factorHeight),
                            // Profit

                          ],
                        ),


                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      width: 390 * factorWidth,
                      height: 180 * factorHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.green),
                        color: HexColor("#F1F1F1"),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.35),
                            spreadRadius: 3,
                            blurRadius: 3,

                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            height: 125 * factorHeight,
                            width: 125 * factorWidth,
                            child: PieChart(
                              PieChartData(
                                sections: [
                                  PieChartSectionData(
                                    color: HexColor("625A94"),
                                    value: 40,
                                    title: '',
                                    radius: 25,
                                  ),
                                  PieChartSectionData(
                                    color: HexColor("#FFDE59"),
                                    value: 30,
                                    title: '',
                                    radius: 25,
                                  ),
                                  PieChartSectionData(
                                    color: HexColor("#A4EB77"),
                                    value: 20,
                                    title: '',
                                    radius: 25,
                                  ),
                                  PieChartSectionData(
                                    color: HexColor("#FFBB8F"),
                                    value: 10,
                                    title: '',
                                    radius: 25,
                                  ),
                                ],
                                borderData: FlBorderData(
                                  show: true,
                                ),
                                sectionsSpace: 0,
                                centerSpaceRadius: 40,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Top merchants",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              indicatorCircle(
                                  factorHeight: factorHeight,
                                  factorWidth: factorWidth,
                                  text: "Spinneys", color: HexColor("625A94")),
                              indicatorCircle(
                                  factorHeight: factorHeight,
                                  factorWidth: factorWidth,
                                  text: "Spinneys", color: HexColor("#FFDE59")),
                              indicatorCircle(
                                  factorHeight: factorHeight,
                                  factorWidth: factorWidth,
                                  text: "McDonalds",
                                  color: HexColor("#A4EB77")),
                              indicatorCircle(
                                  factorHeight: factorHeight,
                                  factorWidth: factorWidth,
                                  text: "Burger King",
                                  color: HexColor("#FFBB8F")),
                            ],
                          )//////
                        ],
                      ),
                    ),// chart1
                    SizedBox(height: 20,),
                    Wrap(
                      spacing: 13.0, // space between items in the same row
                      runSpacing: 16.0,
                      children: [
                        itemSquare(
                            heading: "12.983.21",
                            title: "profit",
                            profit: "+30%",
                            image: "assets/images/img.png",
                            factorWidth: factorWidth,
                            factorHeight: factorHeight),
                        itemSquare(
                            heading: "12.983.21",
                            title: "profit",
                            profit: "+30%",
                            image: "assets/images/img.png",
                            factorWidth: factorWidth,
                            factorHeight: factorHeight),
                        itemSquare(
                            heading: "12.983.21",
                            title: "profit",
                            profit: "+30%",
                            image: "assets/images/img.png",
                            factorWidth: factorWidth,
                            factorHeight: factorHeight),
                        itemSquare(
                            heading: "12.983.21",
                            title: "profit",
                            profit: "+30%",
                            image: "assets/images/img.png",
                            factorWidth: factorWidth,
                            factorHeight: factorHeight),

                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 270*factorHeight,
                      width: 390 * factorWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.green),
                        color: HexColor("#F1F1F1"),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.35),
                            spreadRadius: 3,
                            blurRadius: 3,

                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(height: 15,),
                          Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,

                            children: [
                              Text(
                                "Bottles and cans Overview",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              indicatorCircle(
                                  factorHeight: factorHeight,
                                  factorWidth: factorWidth,
                                  text: "Cans",
                                  color: HexColor("#62B145")),

                              indicatorCircle(
                                  factorHeight: factorHeight,
                                  factorWidth: factorWidth,
                                  text: "Bottles",
                                  color: HexColor("#ABD67D")),
                            ],

                          ),
                          SizedBox(
                            height: 30,
                          ),


                          Expanded(

                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 10
                              ),
                              child: BarChart(
                                BarChartData(
                                  maxY: 20,

                                  titlesData: FlTitlesData(
                                    show: true,
                                    rightTitles:  AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    topTitles:  AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        getTitlesWidget: DashboardCubit.get(context).bottomTitles,
                                        reservedSize: 42,
                                      ),
                                    ),
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        reservedSize: 28,
                                        interval: 1,
                                        getTitlesWidget: DashboardCubit.get(context).leftTitles,
                                      ),
                                    ),
                                  ),
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  barGroups: showingBarGroups,
                                  gridData:  FlGridData(show: false),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),// bottle and cans charts
                    SizedBox(height: 20,),
                    Container(
                      height: 270*factorHeight,
                      width: 390 * factorWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.green),
                        color: HexColor("#F1F1F1"),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.35),
                            spreadRadius: 3,
                            blurRadius: 3,

                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Bottles and cans Overview",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              indicatorCircle(
                                  factorHeight: factorHeight,
                                  factorWidth: factorWidth,
                                  text: "Cans",
                                  color: HexColor("#62B145")),

                              indicatorCircle(
                                  factorHeight: factorHeight,
                                  factorWidth: factorWidth,
                                  text: "Bottles",
                                  color: HexColor("#ABD67D")),
                            ],

                          ),
                          SizedBox(
                            height: 30,
                          ),


                          Expanded(

                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10
                              ),
                              child: BarChart(
                                BarChartData(
                                  maxY: 20,

                                  titlesData: FlTitlesData(
                                    show: true,
                                    rightTitles:  AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    topTitles:  AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        getTitlesWidget: DashboardCubit.get(context).bottomTitles,
                                        reservedSize: 42,
                                      ),
                                    ),
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        reservedSize: 28,
                                        interval: 1,
                                        getTitlesWidget: DashboardCubit.get(context).leftTitles,
                                      ),
                                    ),
                                  ),
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  barGroups: showingBarGroups,
                                  gridData:  FlGridData(show: false),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),// bottle and cans charts
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
