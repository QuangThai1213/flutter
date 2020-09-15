import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Cubit/grid_list_cubit.dart';
import 'View/news_screen.dart';

class CounterPage extends StatelessWidget {
  /// {@macro counter_page}
  const CounterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GridListCubit(),
      child: NewsScreen(),
    );
  }
}
