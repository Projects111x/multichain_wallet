import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class HomeController extends GetxController {
  static final coinList = [
    {'name': 'Ethereum', 'symbol': 'ETH', 'api_id': 'ethereum', 'amount': '50'},
    {'name': 'Bitcoin', 'symbol': 'BTC', 'api_id': 'bitcoin', 'amount': '2.05'},
    {
      'name': 'Binance Coin',
      'symbol': 'BNB',
      'api_id': 'binancecoin',
      'amount': '5',
    },
    {'name': 'Tron', 'symbol': 'TRX', 'api_id': 'tron', 'amount': '1200'},
    {'name': 'Solana', 'symbol': 'SOL', 'api_id': 'solana', 'amount': '50'},
    {'name': 'Sui', 'symbol': 'SUI', 'api_id': 'sui', 'amount': '200'},
    {'name': 'Polkadot', 'symbol': 'DOT', 'api_id': 'polkadot', 'amount': '40'},
    {'name': 'Cosmos', 'symbol': 'ATOM', 'api_id': 'cosmos', 'amount': '30'},
    {
      'name': 'Dogecoin',
      'symbol': 'DOGE',
      'api_id': 'dogecoin',
      'amount': '3000',
    },
    {'name': 'Cardano', 'symbol': 'ADA', 'api_id': 'cardano', 'amount': '600'},
  ];
  final holdings = <Map<String, dynamic>>[].obs;
  final charts = <String, RxList<double>>{}.obs;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Timer? _priceTimer;
  final Dio _dio = Dio();

  @override
  void onInit() {
    super.onInit();

    for (final coin in coinList) {
      charts[coin['symbol']!] = <double>[].obs;
    }

    holdings.assignAll(coinList.map((e) => {...e, 'usd': '0.0'}).toList());

    fetchAllData();

    _priceTimer = Timer.periodic(
      const Duration(seconds: 60),
      (_) => fetchAllData(),
    );
  }

  @override
  void onClose() {
    _priceTimer?.cancel();
    super.onClose();
  }

  Future<void> fetchAllData() async {
    await fetchPrices();
    await fetchChartsCombined();
  }

  Future<void> fetchPrices() async {
    try {
      final ids = coinList.map((e) => e['api_id']).join(',');
      final response = await _dio.get(
        'https://api.coingecko.com/api/v3/simple/price',
        queryParameters: {'ids': ids, 'vs_currencies': 'usd'},
      );

      for (var i = 0; i < holdings.length; i++) {
        final apiId = coinList[i]['api_id'];
        holdings[i]['usd'] = response.data[apiId]?['usd']?.toString() ?? '0.0';
      }

      holdings.refresh();
    } on DioException catch (e) {
      if (e.response?.statusCode == 429) {
        debugPrint("Rate limit reached! Waiting before retry...");
        await Future.delayed(const Duration(seconds: 10));
      } else {
        debugPrint("Error fetching prices: $e");
      }
    }
  }

  Future<void> fetchChartsCombined() async {
    for (final coin in coinList) {
      try {
        final response = await _dio.get(
          'https://api.coingecko.com/api/v3/coins/${coin['api_id']}/market_chart',
          queryParameters: {'vs_currency': 'usd', 'days': 7},
        );

        final prices = response.data['prices'] as List;
        charts[coin['symbol']]?.assignAll(
          prices.map<double>((e) => (e[1] as num).toDouble()).toList(),
        );
      } on DioException catch (e) {
        if (e.response?.statusCode == 429) {
          debugPrint(
            "Chart rate limit reached for ${coin['symbol']}! Waiting...",
          );
          await Future.delayed(const Duration(seconds: 10));
        }
        charts[coin['symbol']]?.clear();
      }
    }
  }

  void drawOpen() => scaffoldKey.currentState?.openDrawer();
  void onDeposit() => Get.toNamed('/deposit');
  void onWithdraw() => Get.toNamed('/withdraw');
  void onSeeAll() {
    Get.toNamed('/details', arguments: {'coins': coinList});
  }
}
