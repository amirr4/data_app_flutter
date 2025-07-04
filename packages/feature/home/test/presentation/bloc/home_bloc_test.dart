import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/home.dart';
import '../../mocks.mocks.dart';
import 'package:mockito/mockito.dart';

void main() {
  late MockFetchItemsUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockFetchItemsUseCase();
  });

  blocTest<HomeBloc, HomeState>(
    'emits [Loading, Loaded] when data is fetched successfully',
    build: () {
      when(mockUseCase()).thenAnswer((_) async => [Item(id: 1, title: 'test', description: 'test description')]);
      return HomeBloc(mockUseCase);
    },
    act: (bloc) => bloc.add(FetchItemsEvent()),
    expect: () => [
      isA<HomeLoading>(),
      isA<HomeLoaded>().having((state) => state.items.length, 'items length', 1),
    ],
  );

  blocTest<HomeBloc, HomeState>(
    'emits [Loading, Error] when usecase throws exception',
    build: () {
      when(mockUseCase()).thenThrow(Exception('failed'));
      return HomeBloc(mockUseCase);
    },
    act: (bloc) => bloc.add(FetchItemsEvent()),
    expect: () => [
      isA<HomeLoading>(),
      isA<HomeError>().having((state) => state.message, 'message', contains('failed')),
    ],
  );
}
