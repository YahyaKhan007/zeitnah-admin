import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zeitnah_admin/ui/constants/app_colors/app_colors.dart';

import '../../../service_provider/service_provider_home/provider_home_widgets/provider_right_side_panel/widget_of_statistics_for_provider/widget_of_statistics_for_provider.dart';
import 'widgets/dashboard_top_bar.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          dashboardTopBar(size: size, context: context),
          16.h.verticalSpace,
          dashboardGraphs(context: context, size: size)
        ],
      ),
    );
  }

  Widget dashboardGraphs({
    required Size size,
    required BuildContext context,
  }) {
    return Row(
      children: [
        graphContainer1(graphNo: 1, size: size),
        24.w.horizontalSpace,
        graphContainer1(graphNo: 2, size: size),
      ],
    );
  }

  Widget graphContainer1({required Size size, required int graphNo}) {
    return Expanded(
      flex: graphNo == 1 ? 5 : 7,
      child: Container(
        height: size.height * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: graphNo == 1
            ? graph1Data(size: size, activeUsers: 2000)
            : graph2Data(),
      ),
    );
  }

  Widget graph1Data({required Size size, required int activeUsers}) {
    return Padding(
      padding: const EdgeInsets.all(16).h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade900, Colors.black],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: BarChart(
                BarChartData(
                  barGroups: createBarGroups(),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          // Display only values from 0 to 500 at intervals of 100
                          if (value % 100 == 0) {
                            return Text(
                              value.toInt().toString(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.sp),
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                    bottomTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.white.withOpacity(0.2),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),
          ),
          16.h.verticalSpace,
          Text(
            "Active Users",
            style:
                TextStyle(fontSize: 12.sp, color: AppColors.kcPrimaryTextColor),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: '(+23) ',
                    style: TextStyle(
                      color: Colors.green.withOpacity(0.5),
                      fontSize: 10.sp,
                    )),
                TextSpan(
                  text: 'than Last Week',
                  style: TextStyle(
                    color: AppColors.kcSecondaryTextColor.withOpacity(0.5),
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),
          8.h.verticalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  height: 24.h,
                  width: 24.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: AppColors.kcPrimaryColor),
                  child: Image.asset('assets/icons/provider.png'),
                ),
                title: Text(
                  'Users',
                  style: TextStyle(
                      color: AppColors.kcgreyFieldColor.withOpacity(0.5),
                      fontSize: 10.sp),
                ),
              ),
              Text(
                activeUsers.toString(),
                style: TextStyle(color: Colors.black, fontSize: 12.sp),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget graph2Data() {
    return Padding(
      padding: const EdgeInsets.all(16).h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Usage Stats",
            style:
                TextStyle(fontSize: 12.sp, color: AppColors.kcPrimaryTextColor),
          ),
          8.h.verticalSpace,
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: '(+5) more ',
                    style: TextStyle(
                      color: Colors.green.withOpacity(0.5),
                      fontSize: 10.sp,
                    )),
                TextSpan(
                  text: 'in 2021',
                  style: TextStyle(
                    color: AppColors.kcSecondaryTextColor.withOpacity(0.5),
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 300,
              padding: const EdgeInsets.all(16),
              child: LineChart(
                LineChartData(
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          if (value % 100 == 0) {
                            return Text(
                              value.toInt().toString(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                    bottomTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: true)),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: FlGridData(show: true),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  minX: 0,
                  maxX: 11,
                  minY: 0,
                  maxY: 500,
                  lineBarsData: [
                    _createLineBarData(
                      isCurved: true,
                      color: Colors.teal.withOpacity(0.5),
                      spots: [
                        FlSpot(0, 200),
                        FlSpot(1, 150),
                        FlSpot(2, 300),
                        FlSpot(3, 250),
                        FlSpot(4, 350),
                        FlSpot(5, 200),
                        FlSpot(6, 400),
                        FlSpot(7, 300),
                        FlSpot(8, 250),
                        FlSpot(9, 350),
                        FlSpot(10, 400),
                      ],
                    ),
                    _createLineBarData(
                      isCurved: true,
                      color: Colors.tealAccent.withOpacity(0.3),
                      spots: [
                        FlSpot(0, 100),
                        FlSpot(1, 80),
                        FlSpot(2, 200),
                        FlSpot(3, 150),
                        FlSpot(4, 250),
                        FlSpot(5, 100),
                        FlSpot(6, 300),
                        FlSpot(7, 200),
                        FlSpot(8, 150),
                        FlSpot(9, 250),
                        FlSpot(10, 300),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  LineChartBarData _createLineBarData({
    required List<FlSpot> spots,
    required bool isCurved,
    required Color color,
  }) {
    return LineChartBarData(
      spots: spots,
      isCurved: isCurved,
      color: Colors.white,
      barWidth: 3,
      isStrokeCapRound: true,
      belowBarData: BarAreaData(
        show: true,
        color: Colors.blue.withOpacity(0.3),
      ),
    );
  }
}
