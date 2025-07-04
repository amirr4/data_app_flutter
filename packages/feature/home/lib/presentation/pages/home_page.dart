import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/home.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('خانه')),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            homeBloc.add(FetchItemsEvent());
            return const Center(child: Text('در حال بارگذاری...'));
          } else if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoaded) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (_, index) {
                final item = state.items[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text('آی‌دی: ${item.id}'),
                );
              },
            );
          } else if (state is HomeError) {
            return Center(child: Text('خطا: ${state.message}'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
