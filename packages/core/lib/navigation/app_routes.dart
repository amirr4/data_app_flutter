import 'package:get/get.dart';
import 'package:home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static const home = HomeRoutes.home;


  static final routes = <GetPage>[
    GetPage(
      name: home,
      binding: HomeBindings(),
      page: () => BlocProvider<HomeBloc>(
        create: (_) => Get.find<HomeBloc>(),
        child: const HomePage(),
      ),
    ),

    GetPage(
      name: HomeRoutes.itemDetail,
      page: () => const ItemDetailPage(),
    ),
  ];
}
