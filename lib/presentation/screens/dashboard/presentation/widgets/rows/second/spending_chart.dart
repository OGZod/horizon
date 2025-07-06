import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:horizon/config/theme/app_colors.dart';

class SpendingChart extends StatefulWidget {
  const SpendingChart({super.key});

  @override
  State<SpendingChart> createState() =>
      _SpendingChartState();
}

class _SpendingChartState extends State<SpendingChart>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  int? touchedIndex;
  bool showTooltip = false;

  // Sample spending data
  final List<SpendingData> spendingData = [
    SpendingData('SEP', 89, 65),
    SpendingData('OCT', 76, 58),
    SpendingData('NOV', 108, 72),
    SpendingData('DEC', 95, 68),
    SpendingData('JAN', 112, 85),
    SpendingData('FEB', 118, 92),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Start animation
    _animationController.forward();

    // Show tooltip after animation
    Future.delayed(Duration(milliseconds: 2500), () {
      if (mounted) {
        setState(() {
          showTooltip = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          reservedSize: 32,
                          getTitlesWidget: (value, meta) {
                            if (value.toInt() < spendingData.length) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  spendingData[value.toInt()].month,
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: constraints.maxWidth < 200 ? 10 : 12,
                                  ),
                                ),
                              );
                            }
                            return Text('');
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    minX: 0,
                    maxX: spendingData.length.toDouble() - 1,
                    minY: 0,
                    maxY: 130,
                    lineBarsData: [
                      LineChartBarData(
                        spots: spendingData
                            .asMap()
                            .entries
                            .map(
                              (entry) => FlSpot(
                            entry.key.toDouble(),
                            entry.value.spending * _animation.value,
                          ),
                        )
                            .toList(),
                        isCurved: true,
                        color: active,

                        barWidth: constraints.maxWidth < 200 ? 2 : 4,
                        isStrokeCapRound: true,
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) {
                            if (index == 2) {
                              // November
                              return FlDotCirclePainter(
                                radius: constraints.maxWidth < 200 ? 6 : 8,
                                color: white,
                                strokeWidth: 3,
                                strokeColor: active,
                              );
                            }
                            return FlDotCirclePainter(
                              radius: 0,
                              color: Colors.transparent,
                            );
                          },
                        ),
                        belowBarData: BarAreaData(show: false),
                      ),
                      // Income line (Blue)
                      LineChartBarData(
                        spots: spendingData
                            .asMap()
                            .entries
                            .map(
                              (entry) => FlSpot(
                            entry.key.toDouble(),
                            entry.value.income * _animation.value,
                          ),
                        )
                            .toList(),
                        isCurved: true,
                        color: Color(0xff39B8FF),
                        barWidth: constraints.maxWidth < 200 ? 2 : 4,
                        isStrokeCapRound: true,
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                );
              },
            ),
            // Responsive Floating Tooltip
            if (showTooltip)
              Positioned(
                top: 30,
                left: _calculateTooltipPosition(constraints.maxWidth),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth < 200 ? 8 : 12,
                    vertical: constraints.maxWidth < 200 ? 6 : 8,
                  ),
                  decoration: BoxDecoration(
                    color: active,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: black.withValues(alpha: 0.2),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    '\$108.00',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: constraints.maxWidth < 200 ? 12 : 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  // Calculate tooltip position based on available width
  double _calculateTooltipPosition(double maxWidth) {
    if (maxWidth < 200) {
      return maxWidth * 0.35; // Position more to the left on small screens
    } else if (maxWidth < 300) {
      return maxWidth * 0.40;
    } else {
      return maxWidth * 0.45; // Original position for larger screens
    }
  }
}

class SpendingData {
  final String month;
  final double spending;
  final double income;

  SpendingData(this.month, this.spending, this.income);
}