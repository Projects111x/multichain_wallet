import 'package:get/get.dart';
import 'package:dio/dio.dart';

class DetailsController extends GetxController {
  final tabs = ['BTC', 'ETH', 'LTC', 'XRP'];
  final apiIds = {
    'BTC': 'bitcoin',
    'ETH': 'ethereum',
    'LTC': 'litecoin',
    'XRP': 'ripple',
  };

  var selectedTab = 0.obs;
  var chartData = <double>[].obs;
  var price = RxnDouble();
  var amount = 2.05; 
  var selectedPercent = 25.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void onTabSelected(int index) {
    selectedTab.value = index;
    fetchData();
  }

  Future<void> fetchData() async {
    final symbol = tabs[selectedTab.value];
    final apiId = apiIds[symbol]!;
    await Future.wait([
      fetchChart(apiId),
      fetchPrice(apiId),
    ]);
  }

  Future<void> fetchChart(String apiId) async {
    try {
      final dio = Dio();
      final response = await dio.get(
        'https://api.coingecko.com/api/v3/coins/$apiId/market_chart',
        queryParameters: {
          'vs_currency': 'usd',
          'days': 7,
        },
      );
      final prices = response.data['prices'] as List;
      chartData.value =
          prices.map<double>((e) => (e[1] as num).toDouble()).toList();
    } catch (e) {
      chartData.value = [];
    }
  }

  Future<void> fetchPrice(String apiId) async {
    try {
      final dio = Dio();
      final response = await dio.get(
        'https://api.coingecko.com/api/v3/simple/price',
        queryParameters: {
          'ids': apiId,
          'vs_currencies': 'usd',
        },
      );
      price.value = (response.data[apiId]['usd'] as num?)?.toDouble();
    } catch (e) {
      price.value = null;
    }
  }

  void onPercentSelected(int percent) {
    selectedPercent.value = percent;
  }

  void onBuy() {}
  void onSell() {}
}
