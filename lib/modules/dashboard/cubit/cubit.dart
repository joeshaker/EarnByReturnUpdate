

import 'package:earn_by_return/modules/dashboard/cubit/states.dart';
import 'package:earn_by_return/shared/network/end_points.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../shared/network/remote/dio_helper.dart';

class DashboardCubit extends Cubit<Dashboardstates> {
  DashboardCubit() : super(DashboardInitalstate());
  static DashboardCubit get(context) => BlocProvider.of(context);
  final double width = 7;
  late List<BarChartGroupData> rawBarGroupsBC;
  late List  titlesBC=[ ];
  late List<BarChartGroupData> rawBarGroupsGV;
  late List  titlesGV=[ ];
  late List  topMerchants=[ ];
  bool last7DaysCheck=true;
  late Map last7Days ={};
  late Map totalData ={};
  late Map  percentage={};
  late List  chartdata=[];

  late List<BarChartGroupData> showingBarGroupsBC;
  late List<BarChartGroupData> showingBarGroupsGV;

  final Color leftBarColor = HexColor("#62B145");
  final Color rightBarColor = HexColor("#ABD67D");
  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.w400,///
      fontSize: 10,
    );
    String text;
    if (value == 0) {
      text = '0';
    }  else if (value == 5) {
      text = '100';
    }
    else if (value == 10) {
      text = '250';
    } else if (value == 15) {
      text = '350';
    }
    else if (value == 19) {
      text = '+500';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }
  void changSelected(){
    last7DaysCheck = !last7DaysCheck;
    emit(DashboardChangSelectedstate());
  }
  Widget bottomTitles( value, TitleMeta meta) {
    titlesBC =titlesBC;

    final Widget text = Text(
      titlesBC[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    double scaledY1 = y1 / 500 * 20;
    double scaledY2 = y2 / 500 * 20;

    // Clamp scaled values to ensure they are within the range [0, 20]
    scaledY1 = scaledY1.clamp(0, 20);
    scaledY2 = scaledY2.clamp(0, 20);
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: scaledY1,
          color: leftBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: scaledY2,
          color: rightBarColor,
          width: width,
        ),
      ],
    );
  }

  void createGroupData() {

    // final barGroup1 = makeGroupData(0, 5, 12);
    // final barGroup2 = makeGroupData(1, 16, 12);
    // final barGroup3 = makeGroupData(2, 18, 5);
    // final barGroup4 = makeGroupData(3, 20, 16);
    // final barGroup5 = makeGroupData(4, 17, 6);
    // final barGroup6 = makeGroupData(5, 19, 1.5);
    // final barGroup7 = makeGroupData(6, 10, 1.5);

    List <BarChartGroupData> itemsBC = [];
    List <BarChartGroupData> itemsGV = [];





    rawBarGroupsBC = itemsBC;
    showingBarGroupsBC = rawBarGroupsBC;
    rawBarGroupsGV= itemsGV;
    showingBarGroupsGV = rawBarGroupsGV;
    DioHelper.getData(
      url: DASHBOARD, query: {},
    ).then((value) {

      if (value.statusCode == 200) {
        last7Days = value.data["profitData"]["last7Days"];
        percentage = value.data["profitData"]["last7Days"]["percentageChange"];
        totalData={
          "totalUsers": value.data["profitData"]["totalUsers"],
          "totalCans": value.data["profitData"]["totalCans"],
          "totalCoins": value.data["profitData"]["totalCoins"],
          "transactionCount": value.data["profitData"]["transactionCount"],
          "profit": value.data["profitData"]["profit"],
          "totalBottles": value.data["profitData"]["totalBottles"],
        };



        chartdata =value.data["cansBottlesData"]["results"];
        topMerchants=value.data["profitData"]["topMerchants"];


        print(chartdata);
        for(int i =0 ; i<chartdata.length;i++){
          titlesBC.add(chartdata[i]["_id"]["dayOfWeek"].substring(0, 3));
          itemsBC.add(makeGroupData(i, chartdata[i]["totalCans"]*1.0  , chartdata[i]["totalBottles"]*1.0));
          itemsGV.add(makeGroupData(i, chartdata[i]["totalGiftCoins"]*1.0  , chartdata[i]["totalVoucherCoins"]*1.0));
        };
        rawBarGroupsBC = itemsBC;
        showingBarGroupsBC = rawBarGroupsBC;

        rawBarGroupsGV = itemsGV;
        showingBarGroupsGV = rawBarGroupsGV;


        emit(DashboardDataCreatedstate());

      }
    }).catchError((error) {
      print(error);
      emit(DashboardErrorstate(
          error.toString(), error.response.data["message"]));
    });


  }
}
