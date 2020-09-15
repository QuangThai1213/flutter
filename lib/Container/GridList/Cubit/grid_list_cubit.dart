import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

/// {@template counter_cubit}
/// A [Cubit] which manages an [int] as its state.
/// {@endtemplate}
class GridListCubit extends HydratedCubit<String> {
  /// {@macro counter_cubit}
  GridListCubit() : super("");

  /// Add 1 to the current state.
  void getRecentSearch() => emit(state);


  @override
  String fromJson(Map<String, dynamic> json) => json['recentSearch'] ;

  @override
  Map<String, String> toJson(String state) => {'recentSearch': state};
}
