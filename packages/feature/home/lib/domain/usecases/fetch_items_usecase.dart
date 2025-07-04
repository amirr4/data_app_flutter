import 'package:home/home.dart';


class FetchItemsUseCase {
  final HomeRepository repository;

  FetchItemsUseCase(this.repository);

  Future<List<Item>> call() async {
    return await repository.fetchItems();
  }
}
