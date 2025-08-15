import 'package:get/get.dart';
import 'package:multi_chain_wallet/app/modules/home/home_controller.dart';

class DetailsController extends GetxController {
  final tabs = <String>[].obs;

  var selectedTab = 0.obs;
  var chartData = <double>[].obs;
  var price = RxnDouble();
  var amount = 0.0;
  var selectedPercent = 25.obs;

  late HomeController home;

  @override
  void onInit() {
    super.onInit();
    home = Get.find<HomeController>();

    for (final coin in home.holdings) {
      final symbol = coin['symbol']!.toString().toUpperCase();
      tabs.add(symbol);
    }

    if (tabs.isNotEmpty) {
      amount = double.tryParse(home.holdings[0]['amount'].toString()) ?? 0.0;
      fetchData();
    }

    ever(selectedTab, (_) => fetchData());
    ever(home.holdings, (_) => fetchData());
  }

  void onTabSelected(int index) {
    selectedTab.value = index;
    amount = double.tryParse(home.holdings[index]['amount'].toString()) ?? 0.0;
  }

  void fetchData() {
    if (tabs.isEmpty) return;

    final symbol = tabs[selectedTab.value];

    final list = home.charts[symbol];
    if (list != null && list.isNotEmpty) {
      chartData.assignAll(list);
    } else {
      chartData.clear();
    }

    final coin = home.holdings.firstWhereOrNull(
      (c) => c['symbol']?.toString().toUpperCase() == symbol,
    );
    price.value = double.tryParse(coin?['usd']?.toString() ?? '');
  }

  void onPercentSelected(int percent) {
    selectedPercent.value = percent;
  }

  void onBuy() {}
  void onSell() {}
}
