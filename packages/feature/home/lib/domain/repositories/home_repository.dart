import 'package:home/home.dart';

abstract class HomeRepository {
  Future<List<Item>> fetchItems();
}
