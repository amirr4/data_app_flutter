import 'package:flutter_test/flutter_test.dart';
import 'package:home/home.dart';
import '../../mocks.mocks.dart';
import 'package:mockito/mockito.dart';

void main() {
  late MockRemoteDataSource mockRemote;
  late HomeRepositoryImpl repository;

  setUp(() {
    mockRemote = MockRemoteDataSource();
    repository = HomeRepositoryImpl(mockRemote);
  });

  test('should return items from remote datasource', () async {
    final items = [ItemModel(id: 1, title: 'test')];

    when(mockRemote.getRemoteItems()).thenAnswer((_) async => items);

    final result = await repository.fetchItems();

    expect(result.length, 1);
    expect(result.first.id, 1);
    expect(result.first.title, 'test');
  });
}
