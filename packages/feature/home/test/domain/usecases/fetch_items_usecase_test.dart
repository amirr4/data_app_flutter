import 'package:flutter_test/flutter_test.dart';
import 'package:home/home.dart';
import '../../mocks.mocks.dart';
import 'package:mockito/mockito.dart';

void main() {
  late MockHomeRepository mockRepository;
  late FetchItemsUseCase useCase;

  setUp(() {
    mockRepository = MockHomeRepository();
    useCase = FetchItemsUseCase(mockRepository);
  });

  test('should return list of items from repository', () async {
    final items = [Item(id: 1, title: 'Test')];

    when(mockRepository.fetchItems()).thenAnswer((_) async => items);

    final result = await useCase();

    expect(result, items);
    verify(mockRepository.fetchItems()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
