import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_chain_wallet/app/theme/app_theme.dart';
import 'home_controller.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  Widget buildCoinChart(String symbol, BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Obx(() {
      final data = controller.charts[symbol] ?? <double>[];
      if (data.isEmpty) {
        return SizedBox(
          width: 46,
          height: 28,
          child: Center(
            child: SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(cs.onSurface),
              ),
            ),
          ),
        );
      }
      return SizedBox(
        width: 46,
        height: 28,
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
                color: AppColors.green,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget buildHoldingsList(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final items = controller.holdings;

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 18),
      itemBuilder: (_, index) {
        final item = items[index];
        return InkWell(
          // onTap: () => controller.onCoinTap(index),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: cs.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.currency_bitcoin,
                  color: cs.onSurface,
                  size: 28,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['name']!,
                      style: textTheme.bodyLarge?.copyWith(
                        color: cs.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      item['symbol']!,
                      style: textTheme.bodySmall?.copyWith(
                        color: cs.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              buildCoinChart(item['symbol']!, context),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${item['usd']}',
                    style: textTheme.bodyLarge?.copyWith(
                      color: cs.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${item['amount']} ${item['symbol']}',
                    style: textTheme.bodySmall?.copyWith(
                      color: cs.onSurface.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Home',
          style: textTheme.titleLarge?.copyWith(color: cs.onSurface),
        ),
        backgroundColor: cs.surface,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 26),
              Text(
                "Hello Alex",
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: cs.onSurface,
                ),
              ),
              const SizedBox(height: 18),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 24,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFFF8C8EC),
                      const Color(0xFFE0C3FC),
                      AppColors.primary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Current Balance",
                      style: textTheme.bodyMedium?.copyWith(
                        color: cs.onPrimary.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "\$87,430.12",
                          style: textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: cs.onPrimary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_upward,
                              size: 18,
                              color: AppColors.green,
                            ),
                            Text(
                              "+10.2%",
                              style: textTheme.bodyMedium?.copyWith(
                                color: AppColors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: controller.onDeposit,
                      child: const Text(
                        "Deposit",
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
                      onPressed: controller.onWithdraw,
                      child: Text(
                        "Withdraw",
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
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Holdings",
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: cs.onSurface,
                    ),
                  ),
                  TextButton(
                    onPressed: controller.onSeeAll,
                    child: Text(
                      "See All",
                      style: textTheme.bodyMedium?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              buildHoldingsList(context),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
