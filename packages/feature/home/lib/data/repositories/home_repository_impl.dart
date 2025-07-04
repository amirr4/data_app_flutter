import 'package:home/home.dart';


class HomeRepositoryImpl implements HomeRepository {
  final RemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Item>> fetchItems() async {
    return await remoteDataSource.getRemoteItems();
  }
}
