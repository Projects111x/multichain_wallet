import 'package:get/get.dart';
import 'package:dio/dio.dart';

class HomeController extends GetxController {
  final holdings = [
    {
      'icon': 'assets/images/eth.png',
      'name': 'Ethereum',
      'symbol': 'ETH',
      'usd': '503.12',
      'amount': '50',
      'api_id': 'ethereum',
    },
    {
      'icon': 'assets/images/btc.png',
      'name': 'Bitcoin',
      'symbol': 'BTC',
      'usd': '26927',
      'amount': '2.05',
      'api_id': 'bitcoin',
    },
    {
      'icon': 'assets/images/ltc.png',
      'name': 'Litecoin',
      'symbol': 'LTC',
      'usd': '6927',
      'amount': '2.05',
      'api_id': 'litecoin',
    },
    {
      'icon': 'assets/images/xrp.png',
      'name': 'Ripple',
      'symbol': 'XRP',
      'usd': '4637',
      'amount': '2.05',
      'api_id': 'ripple',
    },
  ];

  // هر کوین یک لیست داده برای چارت داره (کلید symbol)
  final Map<String, RxList<double>> charts = {
    'BTC': <double>[].obs,
    'ETH': <double>[].obs,
    'LTC': <double>[].obs,
    'XRP': <double>[].obs,
  };

  @override
  void onInit() {
    super.onInit();
    fetchAllCharts();
  }

  Future<void> fetchAllCharts() async {
    for (final coin in holdings) {
      await fetchChart(coin['api_id']!, coin['symbol']!);
    }
  }

  Future<void> fetchChart(String apiId, String symbol) async {
    try {
      final dio = Dio();
      final response = await dio.get(
        'https://api.coingecko.com/api/v3/coins/$apiId/market_chart',
        queryParameters: {'vs_currency': 'usd', 'days': 7},
      );
      final prices = response.data['prices'] as List;
      charts[symbol]?.value =
          prices.map<double>((e) => (e[1] as num).toDouble()).toList();
    } catch (e) {
      charts[symbol]?.value = [];
    }
  }

  void onDeposit() {}
  void onWithdraw() {}
  void onSeeAll() {}
}
