import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_chain_wallet/app/theme/app_theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({super.key});

  Widget buildTabBar() {
    return Row(
      children: List.generate(controller.tabs.length, (index) {
        final selected = controller.selectedTab.value == index;
        return GestureDetector(
          onTap: () => controller.onTabSelected(index),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  controller.tabs[index],
                  style: TextStyle(
                    color: selected ? AppColors.primary : AppColors.gray,
                    fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 6),
                if (selected)
                  Container(
                    width: 24,
                    height: 3,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget buildChart() {
    return Obx(() {
      final data = controller.chartData;
      if (data.isEmpty) {
        return SizedBox(
          height: 170,
          child: Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
              strokeWidth: 2.2,
            ),
          ),
        );
      }
      return Container(
        height: 170,
        margin: EdgeInsets.symmetric(vertical: 18),
        padding: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: LinearGradient(
            colors: [AppColors.primary.withOpacity(0.08), Colors.black12],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(show: false),
            borderData: FlBorderData(show: false),
            minY: data.reduce((a, b) => a < b ? a : b),
            maxY: data.reduce((a, b) => a > b ? a : b),
            lineBarsData: [
              LineChartBarData(
                spots: List.generate(
                  data.length,
                  (i) => FlSpot(i.toDouble(), data[i]),
                ),
                isCurved: true,
                barWidth: 2.2,
                color: AppColors.primary,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: Container(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Obx(() {
            final symbol = controller.tabs[controller.selectedTab.value];
            final price = controller.price.value;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top bar
                Row(
                  children: [
                    Text(
                      "Trading",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.settings, color: Colors.white, size: 28),
                  ],
                ),
                SizedBox(height: 14),
                buildTabBar(),
                SizedBox(height: 18),
                // Coin Info
                Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/${symbol.toLowerCase()}.png',
                          width: 28,
                        ),
                      ),
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getCoinName(symbol),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            symbol,
                            style: TextStyle(
                              color: AppColors.gray,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          price == null
                              ? '--'
                              : "\$${price.toStringAsFixed(2)}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "${controller.amount} $symbol",
                          style: TextStyle(
                            color: AppColors.gray,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Chart
                buildChart(),
                // Buy / Sell
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: controller.onBuy,
                        child: Text(
                          "Buy",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.white, width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: controller.onSell,
                        child: Text(
                          "Sell",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // At Price + Amount
                Text(
                  "At Price | USD",
                  style: TextStyle(color: AppColors.gray, fontSize: 15),
                ),
                SizedBox(height: 5),
                Text(
                  price == null
                      ? '--'
                      : (price * controller.amount).toStringAsFixed(2),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Amount",
                      style: TextStyle(color: AppColors.gray, fontSize: 15),
                    ),
                    Text(
                      price == null
                          ? '--'
                          : "${(price * controller.amount).toStringAsFixed(0)} USD",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Percent Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                      [25, 50, 100].map((percent) {
                        final selected =
                            controller.selectedPercent.value == percent;
                        return GestureDetector(
                          onTap: () => controller.onPercentSelected(percent),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color:
                                  selected
                                      ? AppColors.primary
                                      : Colors.white.withOpacity(0.05),
                            ),
                            child: Text(
                              "$percent%",
                              style: TextStyle(
                                color: selected ? Colors.white : AppColors.gray,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),
                SizedBox(height: 8),
                Divider(color: Colors.white10, thickness: 1),
              ],
            );
          }),
        ),
      ),
    );
  }

  String getCoinName(String symbol) {
    switch (symbol) {
      case 'BTC':
        return 'Bitcoin';
      case 'ETH':
        return 'Ethereum';
      case 'LTC':
        return 'Litecoin';
      case 'XRP':
        return 'Ripple';
      default:
        return symbol;
    }
  }
}
