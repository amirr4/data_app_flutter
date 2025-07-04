import 'package:get/get.dart';
import 'package:network/network.dart';
import 'package:home/home.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    // Network Layer
    Get.lazyPut<HttpService>(() => HttpServiceImpl());
    Get.lazyPut(() => NetworkManager(Get.find()));

    // Data Source
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSourceImpl(Get.find()));

    // Repository
    Get.lazyPut<HomeRepository>(() => HomeRepositoryImpl(Get.find()));

    // UseCase
    Get.lazyPut(() => FetchItemsUseCase(Get.find()));

    // BLoC
    Get.lazyPut(() => HomeBloc(Get.find()));
  }
}
