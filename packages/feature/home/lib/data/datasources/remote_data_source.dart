import 'dart:convert';

import 'package:network/network.dart';
import 'package:home/home.dart';

abstract class RemoteDataSource {
  Future<List<Item>> getRemoteItems();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final NetworkManager networkManager;

  RemoteDataSourceImpl(this.networkManager);

  @override
  Future<List<Item>> getRemoteItems() async {
    final response = await networkManager.fetchData('/posts');

    if (response.isSuccess && response.data != null) {
      final List<dynamic> jsonList = jsonDecode(response.data!);
      return jsonList
          .map((json) => ItemModel.fromJson(json).toEntity())
          .toList();
    } else {
      throw Exception(response.error ?? 'خطای ناشناخته');
    }
  }
}
