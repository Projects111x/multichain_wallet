import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:multi_chain_wallet/app/modules/home/home_controller.dart';
import 'details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({super.key});

  Widget _tabBar(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(controller.tabs.length, (index) {
            final selected = controller.selectedTab.value == index;
            return GestureDetector(
              onTap: () => controller.onTabSelected(index),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      controller.tabs[index],
                      style: textTheme.bodyLarge?.copyWith(
                        color:
                            selected
                                ? cs.primary
                                : cs.onSurface.withOpacity(0.6),
                        fontWeight:
                            selected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 6),
                    if (selected)
                      Container(
                        width: 24,
                        height: 3,
                        decoration: BoxDecoration(
                          color: cs.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }),
        ),
      );
    });
  }

  Widget _chart(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Obx(() {
      final data = controller.chartData;
      if (data.isEmpty) {
        return const SizedBox(
          height: 170,
          child: Center(child: CircularProgressIndicator(strokeWidth: 2.2)),
        );
      }
      return Container(
        height: 170,
        margin: const EdgeInsets.symmetric(vertical: 18),
        padding: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: LinearGradient(
            colors: [cs.primary.withOpacity(0.08), cs.surface],
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
                color: cs.primary,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _coinInfo(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Obx(() {
      final symbol = controller.tabs[controller.selectedTab.value];
      final price = controller.price.value;

      return Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: cs.surface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(
                Icons.currency_bitcoin,
                color: cs.onSurface,
                size: 28,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _coinName(symbol),
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: cs.onSurface,
                  ),
                ),
                Text(
                  symbol,
                  style: textTheme.bodySmall?.copyWith(
                    color: cs.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price == null ? '--' : "\$${price.toStringAsFixed(2)}",
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: cs.onSurface,
                ),
              ),
              Text(
                "${controller.amount} $symbol",
                style: textTheme.bodySmall?.copyWith(
                  color: cs.onSurface.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }

  Widget _amountSection(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "At Price | USD",
          style: textTheme.bodyMedium?.copyWith(
            color: cs.onSurface.withOpacity(0.6),
          ),
        ),
        const SizedBox(height: 5),
        Obx(() {
          final price = controller.price.value;
          return Text(
            price == null
                ? '--'
                : (price * controller.amount).toStringAsFixed(2),
            style: textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: cs.onSurface,
            ),
          );
        }),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Amount",
              style: textTheme.bodyMedium?.copyWith(
                color: cs.onSurface.withOpacity(0.6),
              ),
            ),
            Obx(() {
              final price = controller.price.value;
              return Text(
                price == null
                    ? '--'
                    : "${(price * controller.amount).toStringAsFixed(0)} USD",
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: cs.onSurface,
                ),
              );
            }),
          ],
        ),
      ],
    );
  }

  Widget _percentButtons(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
            [25, 50, 100].map((percent) {
              final selected = controller.selectedPercent.value == percent;
              return GestureDetector(
                onTap: () => controller.onPercentSelected(percent),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color:
                        selected ? cs.primary : cs.onSurface.withOpacity(0.05),
                  ),
                  child: Text(
                    "$percent%",
                    style: textTheme.bodyMedium?.copyWith(
                      color: selected ? Colors.white : cs.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            }).toList(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: cs.background,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Trading",
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: cs.onSurface,
                ),
              ),
              const SizedBox(height: 14),

              _tabBar(context),
              const SizedBox(height: 18),

              _coinInfo(context),

              _chart(context),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: cs.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: controller.onBuy,
                      child: const Text(
                        "Buy",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: cs.onSurface, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: controller.onSell,
                      child: Text(
                        "Sell",
                        style: TextStyle(
                          color: cs.onSurface,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              _amountSection(context),
              const SizedBox(height: 10),

              _percentButtons(context),

              const SizedBox(height: 8),
              Divider(color: cs.onSurface.withOpacity(0.1), thickness: 1),
            ],
          ),
        ),
      ),
    );
  }

  String _coinName(String symbol) {
    final match = HomeController.coinList.firstWhereOrNull(
      (coin) =>
          coin['symbol']?.toString().toUpperCase() == symbol.toUpperCase(),
    );
    return match != null ? match['name'] ?? symbol : symbol;
  }
}
