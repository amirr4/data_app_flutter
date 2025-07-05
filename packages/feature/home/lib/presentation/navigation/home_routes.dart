import 'package:get/get.dart';
import 'package:home/home.dart';

class HomeRoutes {
  static const home = '/home';
  static const itemDetail = '/home/item-detail';

  static final List<GetPage> routes = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: itemDetail, page: () => const ItemDetailPage()),
  ];
}
