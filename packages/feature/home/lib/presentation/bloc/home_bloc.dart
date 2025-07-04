import 'package:home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchItemsUseCase fetchItemsUseCase;

  HomeBloc(this.fetchItemsUseCase) : super(HomeInitial()) {
    on<FetchItemsEvent>((event, emit) async {
      emit(HomeLoading());
      try {
        final items = await fetchItemsUseCase();
        emit(HomeLoaded(items));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
  }
}